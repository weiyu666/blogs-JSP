////////////////////////////////////////////////////////////////////////////////
///名称：多媒休编辑器
///网址：http://www.avpx.net
///Edit By Mal
////////////////////////////////////////////////////////////////////////////////
var gSetColorType = ""; 
var gIsIE = document.all; 
var gIEVer = fGetIEVer();
var gLoaded = false;
var ev = null;

function fGetEv(e){
	ev = e;
}
function fGetIEVer(){
	var iVerNo = 0;
	var sVer = navigator.userAgent;
	if(sVer.indexOf("MSIE")>-1){
		var sVerNo = sVer.split(";")[1];
		sVerNo = sVerNo.replace("MSIE","");
		iVerNo = parseFloat(sVerNo);
	}
	return iVerNo;
}

/*****************************/

function InsertPicture() {
	var f = window.frames["HtmlEditor"];
	var str = showModalDialog("images.htm", "", "dialogWidth:438px;dialogHeight:424px;scroll:no;status:0;help:0");
	var range = f.document.selection.createRange();
	var newstr=f.document.getElementsByTagName("BODY")[0].innerHTML;
	f.focus();
	if(str != null){
		range.pasteHTML(newstr+str);
	}
	f.focus();
}
// 插入mediaplayer
function InsertMediaPlayer() {
	var f = window.frames["HtmlEditor"];
	var str = showModalDialog("media.htm", "", "dialogWidth:320px;dialogHeight:190px;scroll:no;status:0;help:0");
	var range = f.document.selection.createRange();
	f.focus();
	if(str != null){
		range.pasteHTML(str);
	}
	f.focus();
}
// 插入代码
function InsertCode() {
	var f = window.frames["HtmlEditor"];
	var str = showModalDialog("InsertCode.htm",window,"dialogWidth:510px;dialogHeight:400px;status:0;scroll:0;help:0;");
	var range = f.document.selection.createRange();
	f.focus();
	if(str != null){
		range.pasteHTML(str);
	}
	f.focus();
}
// 插入Flash
function InsertFlash() {
	var f = window.frames["HtmlEditor"];
	var str = showModalDialog("flash.htm", "", "dialogWidth:320px;dialogHeight:220px;scroll:no;status:no;help:no;"); 
	var range = f.document.selection.createRange();
	f.focus();
	if(str != null){
		range.pasteHTML(str);
	}
	f.focus();
}


/********************************/

function fSetEditable(){
	var f = window.frames["HtmlEditor"];
	f.document.designMode="on";
	if(!gIsIE)
		f.document.execCommand("useCSS",false, true);
}
function fSetFrmClick(){
	var f = window.frames["HtmlEditor"];
	f.document.onmousemove = function(){
		window.onblur();
	}
	f.document.onclick = function(){
		fHideMenu();
	}
}
function fSetHtmlContent(){
	var html = oLinkField.value	
	if (html)
	{
		var header = "<head><link rel=\"stylesheet\" type=\"text/css\" href=\"style/editorArea.css\" /></head><body MONOSPACE>" ;
		var f = window.frames["HtmlEditor"];
		f.document.open();
		//f.document.getElementsByTagName("BODY")[0].innerHTML = oLinkField.value;
		f.document.write(header + oLinkField.value);
		f.document.close();
	}
}
function fSetColor(){
	var dvForeColor =document.getElementById("dvForeColor");
	if(dvForeColor.getElementsByTagName("TABLE").length == 1){
		dvForeColor.innerHTML = drawCube() + dvForeColor.innerHTML;
	}
}
//var oURL = document.referrer;
var oURL = location.href;
var offset = oURL.lastIndexOf("ID=");
if (offset == -1)
{
	alert("请传入调用参数ID，即隐藏的内容表单项ID！");
} else {
	offset = offset + 3
}
var sLinkFieldName = oURL.substring(offset)
var oLinkField = parent.document.getElementsByName(sLinkFieldName)[0];
var oForm = oLinkField.form ;

function getfocus()
{
    window.frames["HtmlEditor"].focus();
}

window.onload = function(){
	try{
		gLoaded = true;
		fSetEditable();
		fSetFrmClick();
		fSetHtmlContent();
		setLinkedField();
		getfocus();
	}catch(e){
		// window.location.reload();
	}
}
window.onblur =function(){
	var dvForeColor =document.getElementById("dvForeColor");
	var dvPortrait =document.getElementById("dvPortrait");
	dvForeColor.style.display = "none";
	dvPortrait.style.display = "none";
	if(!gIsIE || 1==1){
		fHideMenu();
	}
}
window.onerror = function(){return true;};
document.onmousemove = function(e){
	if(gIsIE) var el = event.srcElement;
	else var el = e.target;
	var tdView = document.getElementById("tdView");
	var tdColorCode = document.getElementById("tdColorCode");
	var dvForeColor =document.getElementById("dvForeColor");
	var dvPortrait =document.getElementById("dvPortrait");
	var fontsize =document.getElementById("fontsize");
	var fontface =document.getElementById("fontface");
//	if(el.tagName == "IMG"){
//		el.style.borderRight="1px #cccccc solid";
//		el.style.borderBottom="1px #cccccc solid";
//	}else{
//		fSetImgBorder();
//	}
	if(el.tagName == "IMG"){
		try{
			if(fCheckIfColorBoard(el)){
				tdView.bgColor = el.parentNode.bgColor;
				tdColorCode.innerHTML = el.parentNode.bgColor
			}
		}catch(e){}
	}else{
		dvForeColor.style.display = "none";
		if(!fCheckIfPortraitBoard(el)) dvPortrait.style.display = "none";
		if(!fCheckIfFontFace(el)) fontface.style.display = "none";
		if(!fCheckIfFontSize(el)) fontsize.style.display = "none";
	}
}
document.onclick = function(e){
	if(gIsIE) var el = event.srcElement;
	else var el = e.target;
	var dvForeColor =document.getElementById("dvForeColor");
	var dvPortrait =document.getElementById("dvPortrait");
	if(el.id == "imgFontface" || el.id == "imgFontsize"){
	
	}else{
		fHideMenu();
	}
	if(el.tagName == "IMG"){
		try{
			if(fCheckIfColorBoard(el)){
				format(gSetColorType, el.parentNode.bgColor);
				dvForeColor.style.display = "none";
				return;
			}
		}catch(e){}
		try{
			if(fCheckIfPortraitBoard(el)){
				format("InsertImage", el.src);
				dvPortrait.style.display = "none";
				return;
			}
		}catch(e){}
	}
}
function format(type, para){
	var f = window.frames["HtmlEditor"];
	var sAlert = "";
	if(!gIsIE){
		switch(type){
			case "Cut":
				sAlert = "你的浏览器安全设置不允许编辑器自动执行剪切操作,请使用键盘快捷键(Ctrl+X)来完成";
				break;
			case "Copy":
				sAlert = "你的浏览器安全设置不允许编辑器自动执行拷贝操作,请使用键盘快捷键(Ctrl+C)来完成";
				break;
			case "Paste":
				sAlert = "你的浏览器安全设置不允许编辑器自动执行粘贴操作,请使用键盘快捷键(Ctrl+V)来完成";
				break;
		}
	}
	if(sAlert != ""){
		alert(sAlert);
		return;
	}
	f.focus();
	if(!para)
		if(gIsIE)
			f.document.execCommand(type)
		else
			f.document.execCommand(type,false,false)
	else
		f.document.execCommand(type,false,para)
	f.focus();
}
function setMode(bStatus){
	var sourceEditor = document.getElementById("sourceEditor");
	var HtmlEditor = document.getElementById("HtmlEditor");
	var divEditor = document.getElementById("divEditor");
	var f = window.frames["HtmlEditor"];
	var body = f.document.getElementsByTagName("BODY")[0];
	if(bStatus){
		sourceEditor.style.display = "";
		HtmlEditor.style.height = "0px";
		divEditor.style.height = "0px";
		sourceEditor.value = body.innerHTML;
	}else{
		sourceEditor.style.display = "none";
		if(gIsIE){
			HtmlEditor.style.height = "286px";
			divEditor.style.height = "286px";
		}else{
			HtmlEditor.style.height = "283px";
			divEditor.style.height = "283px";
		}
		body.innerHTML = sourceEditor.value;
		//fSetEditable();
	}
}
function foreColor(e) {
	var sColor = fDisplayColorBoard(e);
	gSetColorType = "foreColor";
	if(gIsIE) format(gSetColorType, sColor);
}
function backColor(e){
	var sColor = fDisplayColorBoard(e);
	if(gIsIE)
		gSetColorType = "backcolor";
	else
		gSetColorType = "backcolor";
	if(gIsIE) format(gSetColorType, sColor);
}
function fDisplayColorBoard(e){
	if(gIsIE){
		var e = window.event;
	}
	if(gIEVer<=5.01 && gIsIE){
		var arr = showModalDialog("ColorSelect.htm", "", "font-family:Verdana; font-size:12; status:no; dialogWidth:21em; dialogHeight:21em");
		if (arr != null) return arr;
		return;
	}
	var dvForeColor =document.getElementById("dvForeColor");
	fSetColor();
	var iX = e.clientX;
	var iY = e.clientY;
	dvForeColor.style.display = "";
	dvForeColor.style.left = (iX-140) + "px";
	dvForeColor.style.top = (iY-10) + "px";
	return true;
}
function createLink() {
	var sURL=window.prompt("Enter link location (e.g. http://www.avpx.net/):", "http://");
	if ((sURL!=null) && (sURL!="http://")){
		format("CreateLink", sURL);
	}
}
function createImg()	{
	var sPhoto=prompt("请输入图片位置:", "http://");
	if ((sPhoto!=null) && (sPhoto!="http://")){
		format("InsertImage", sPhoto);
	}
}
function addPortrait(e){
	if(gIEVer<=5.01 && gIsIE){
		var imgurl = showModalDialog("portraitSelect.htm","", "font-family:Verdana; font-size:12; status:no; unadorned:yes; scroll:no; resizable:yes;dialogWidth:40em; dialogHeight:20em");
		if (imgurl != null)	format("InsertImage", imgurl);
		return;
	}
	var dvPortrait =document.getElementById("dvPortrait");
	var tbPortrait = document.getElementById("tbPortrait");
	var iX = e.clientX;
	var iY = e.clientY;
	dvPortrait.style.display = "";
	if(window.screen.width == 1024){
		dvPortrait.style.left = (iX-380) + "px";
	}else{
		if(gIsIE)
			dvPortrait.style.left = (iX-380) + "px";
		else
			dvPortrait.style.left = (iX-380) + "px";
	}
	dvPortrait.style.top = (iY-8) + "px";
	dvPortrait.innerHTML = '<table width="100%" border="0" cellpadding="5" cellspacing="1" style="cursor:hand" bgcolor="black" ID="tbPortrait"><tr align="left" bgcolor="#f8f8f8" class="unnamed1" align="center" ID="trContent">'+ drawPortrats() +'</tr>	</table>';
}
function fCheckIfColorBoard(obj){
	if(obj.parentNode){
		if(obj.parentNode.id == "dvForeColor") return true;
		else return fCheckIfColorBoard(obj.parentNode);
	}else{
		return false;
	}
}
function fCheckIfPortraitBoard(obj){
	if(obj.parentNode){
		if(obj.parentNode.id == "dvPortrait") return true;
		else return fCheckIfPortraitBoard(obj.parentNode);
	}else{
		return false;
	}
}
function fCheckIfFontFace(obj){
	if(obj.parentNode){
		if(obj.parentNode.id == "fontface") return true;
		else return fCheckIfFontFace(obj.parentNode);
	}else{
		return false;
	}
}
function fCheckIfFontSize(obj){
	if(obj.parentNode){
		if(obj.parentNode.id == "fontsize") return true;
		else return fCheckIfFontSize(obj.parentNode);
	}else{
		return false;
	}
}
function fImgOver(el){
	if(el.tagName == "IMG"){
		el.style.borderRight="1px #cccccc solid";
		el.style.borderBottom="1px #cccccc solid";
	}
}
function fImgMoveOut(el){
	if(el.tagName == "IMG"){
		el.style.borderRight="1px #F3F8FC solid";
		el.style.borderBottom="1px #F3F8FC solid";
	}
}
String.prototype.trim = function(){
	return this.replace(/(^\s*)|(\s*$)/g, "");
}
function fSetBorderMouseOver(obj) {
	obj.style.borderRight="1px solid #aaa";
	obj.style.borderBottom="1px solid #aaa";
	obj.style.borderTop="1px solid #fff";
	obj.style.borderLeft="1px solid #fff";
	/*var sd = document.getElementsByTagName("div");
	for(i=0;i<sd.length;i++) {
		sd[i].style.display = "none";
	}*/
} 

function fSetBorderMouseOut(obj) {
	obj.style.border="none";
}

function fSetBorderMouseDown(obj) {
	obj.style.borderRight="1px #F3F8FC solid";
	obj.style.borderBottom="1px #F3F8FC solid";
	obj.style.borderTop="1px #cccccc solid";
	obj.style.borderLeft="1px #cccccc solid";
}

function fDisplayElement(element,displayValue) {
	if(gIEVer<=5.01 && gIsIE){
		if(element == "fontface"){
			var sReturnValue = showModalDialog("FontFaceSelect.htm","", "font-family:Verdana; font-size:12; status:no; unadorned:yes; scroll:no; resizable:yes;dialogWidth:112px; dialogHeight:271px");;
			format("fontname",sReturnValue);
		}else{
			var sReturnValue = showModalDialog("FontSizeSelect.htm","", "font-family:Verdana; font-size:12; status:no; unadorned:yes; scroll:no; resizable:yes;dialogWidth:130px; dialogHeight:250px");;
			format("fontsize",sReturnValue);
		}
		return;
	}
	if(element == "fontface"){
		var fontsize = document.getElementById("fontsize");
		fontsize.style.display = "none";
	}else if(element == "fontsize"){
		var fontface = document.getElementById("fontface");
		fontface.style.display = "none";
	}

	if ( typeof element == "string" )
		element = document.getElementById(element);
	if (element == null) return;
	element.style.display = displayValue;
	if(gIsIE){
		var e = event;
	}else{
		var e = ev;
	}
	var iX = e.clientX;
	var iY = e.clientY;
	element.style.display = "";
	element.style.left = (iX-40) + "px";
	element.style.top = (iY-10) + "px";
	return true;
}
function fSetModeTip(obj){
	var x = f_GetX(obj);
	var y = f_GetY(obj);
	var dvModeTip = document.getElementById("dvModeTip");
	if(!dvModeTip){
		var dv = document.createElement("DIV");
		dv.style.position = "absolute";
		dv.style.top = (y+20) + "px";
		dv.style.left = (x-40) + "px";
		dv.style.zIndex = "999";
		dv.style.fontSize = "12px";
		dv.id = "dvModeTip";
		dv.style.padding = "2 2 0 2px";
		dv.style.border = "1px #000000 solid";
		dv.style.backgroundColor = "#FFFFCC";
		dv.style.height = "12px";
		dv.innerHTML = "编辑源码";
		document.body.appendChild(dv);
	}else{
		dvModeTip.style.display = "";
	}
}
function fHideTip(){
	document.getElementById("dvModeTip").style.display = "none";
}
function f_GetX(e)
{
	var l=e.offsetLeft;
	while(e=e.offsetParent){				
		l+=e.offsetLeft;
	}
	return l;
}
function f_GetY(e)
{
	var t=e.offsetTop;
	while(e=e.offsetParent){
		t+=e.offsetTop;
	}
	return t;
}
function fHideMenu(){
	var fontface = document.getElementById("fontface");
	var fontsize = document.getElementById("fontsize");
	fontface.style.display = "none";
	fontsize.style.display = "none";
}
// 替换特殊字符
function HTMLEncode(text){
	text = text.replace(/&/g, "&amp;") ;
	text = text.replace(/"/g, "&quot;") ;
	text = text.replace(/</g, "&lt;") ;
	text = text.replace(/>/g, "&gt;") ;
	text = text.replace(/'/g, "&#146;") ;
	text = text.replace(/\ /g,"&nbsp;");
	text = text.replace(/\n/g,"<br>");
	text = text.replace(/\t/g,"&nbsp;&nbsp;&nbsp;&nbsp;");
	return text;
}
//===============================================
// 单个过滤
// 输入参数：
//	s_Content	:	要转换的数据字符串
//	s_Filter	:	要过滤掉的单个格式
//===============================================
function DecodeFilter(html, filter){
	switch(filter.toUpperCase()){
	case "SCRIPT":		// 去除所有客户端脚本javascipt,vbscript,jscript,js,vbs,event,...
		html = execRE("</?script[^>]*>", "", html);
		html = execRE("(javascript|jscript|vbscript|vbs):", "$1：", html);
		html = execRE("on(mouse|exit|error|click|key)", "<I>on$1</I>", html);
		html = execRE("&#", "<I>&#</I>", html);
		break;
	case "TABLE":		// 去除表格<table><tr><td><th>
		html = execRE("</?table[^>]*>", "", html);
		html = execRE("</?tr[^>]*>", "", html);
		html = execRE("</?th[^>]*>", "", html);
		html = execRE("</?td[^>]*>", "", html);
		break;
	case "CLASS":		// 去除样式类class=""
		html = execRE("(<[^>]+) class=[^ |^>]*([^>]*>)", "$1 $2", html) ;
		break;
	case "STYLE":		// 去除样式style=""
		html = execRE("(<[^>]+) style=\"[^\"]*\"([^>]*>)", "$1 $2", html);
		break;
	case "XML":			// 去除XML<?xml>
		html = execRE("<\\?xml[^>]*>", "", html);
		break;
	case "NAMESPACE":	// 去除命名空间<o:p></o:p>
		html = execRE("<\/?[a-z]+:[^>]*>", "", html);
		break;
	case "FONT":		// 去除字体<font></font>
		html = execRE("</?font[^>]*>", "", html);
		break;
	case "MARQUEE":		// 去除字幕<marquee></marquee>
		html = execRE("</?marquee[^>]*>", "", html);
		break;
	case "OBJECT":		// 去除对象<object><param><embed></object>
		html = execRE("</?object[^>]*>", "", html);
		html = execRE("</?param[^>]*>", "", html);
		html = execRE("</?embed[^>]*>", "", html);
		break;
	default:
	}
	return html;
}

// ============================================
// 执行正则表达式替换
// ============================================
function execRE(re, rp, content) {
	oReg = new RegExp(re, "ig");
	r = content.replace(oReg, rp);
	return r; 
}
// 设置所属表单的提交或reset事件
function setLinkedField() {
	if (! oLinkField) return ;
	var oForm = oLinkField.form ;
	if (!oForm) return ;
	oForm.attachEvent("onsubmit", AttachSubmit);
	oForm.attachEvent("onreset", AttachReset);
}
// 提交表单
function AttachSubmit() { 
	var html = window.frames["HtmlEditor"].document.getElementsByTagName("BODY")[0].innerHTML;
	if ( (html.toLowerCase() == "<p>&nbsp;</p>") || (html.toLowerCase() == "<p></p>") ){
		html = "";
	}
	oLinkField.value = html
} 
// 附加Reset事件
function AttachReset() {
	window.frames["HtmlEditor"].document.getElementsByTagName("BODY")[0].innerHTML = oLinkField.value;
}
