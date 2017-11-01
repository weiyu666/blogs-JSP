////////////////////////////////////////////////////////////////////////////////
///名称：多媒休编辑器
///网址：http://www.avpx.net
///Edit By Mal
////////////////////////////////////////////////////////////////////////////////
// 表情数组数据
var imagePath = "images/smiles/";
var imageWidth = 19;
var imageHeight = 19;
var countPerRow = 14;
var sHTML = "";
var sHTMLHead = "";
function portrait(name, alt, shortcut)
{
    this.name = name;
    this.alt = alt;
    this.shortcut = shortcut;
}

    var imgArray = new Array();
    imgArray[0] = new portrait("smile01.gif", "微笑", ":)");
    imgArray[1] = new portrait("smile02.gif", "开怀笑", ":))");
    imgArray[2] = new portrait("smile03.gif", "眨眼" ,"");
    imgArray[3] = new portrait("smile04.gif", "惊讶" ,"");
    imgArray[4] = new portrait("smile05.gif", "吐舌笑脸" ,"");
    imgArray[5] = new portrait("smile06.gif", "得意的笑" ,"");
    imgArray[6] = new portrait("smile07.gif", "生气" ,"");
    imgArray[7] = new portrait("smile08.gif", "怕怕" ,"");
    imgArray[8] = new portrait("smile09.gif", "尴尬" ,"");
    imgArray[9] = new portrait("smile10.gif", "难过" ,"");
    imgArray[10] = new portrait("smile11.gif", "哭泣" , "");
    imgArray[11] = new portrait("smile12.gif", "失望" , "");
    imgArray[12] = new portrait("smile13.gif", "困了" , "");
    imgArray[13] = new portrait("smile14.gif", "好好笑" , "");
    imgArray[14] = new portrait("smile15.gif", "啵" , "");
    imgArray[15] = new portrait("smile16.gif", "电到了" , "");
    imgArray[16] = new portrait("smile17.gif", "汗" , "");
    imgArray[17] = new portrait("smile18.gif", "流口水了" , "");
    imgArray[18] = new portrait("smile19.gif", "真困啊" , "");
    imgArray[19] = new portrait("smile20.gif", "我吐" , "");
    imgArray[20] = new portrait("smile21.gif", "？？？" , "");
    imgArray[21] = new portrait("smile22.gif", "嘘" , "");
    imgArray[22] = new portrait("smile23.gif", "砸死你" , "");
    imgArray[23] = new portrait("smile24.gif", "不说" , "");
    imgArray[24] = new portrait("smile25.gif", "坏" , "");
    imgArray[25] = new portrait("smile26.gif", "色迷迷" , "");
    imgArray[26] = new portrait("smile27.gif", "教训" , "");
    imgArray[27] = new portrait("smile28.gif", "可爱" , "");
    imgArray[28] = new portrait("smile29.gif", "YEAH" , "");
    imgArray[29] = new portrait("smile30.gif", "崩溃" , "");
    imgArray[30] = new portrait("smile31.gif", "鄙视" , "");
    imgArray[31] = new portrait("smile32.gif", "开心" , "");
    imgArray[32] = new portrait("smile33.gif", "仰慕你" , "");
    imgArray[33] = new portrait("smile34.gif", "晕" , "");
    imgArray[34] = new portrait("smile35.gif", "挖鼻孔" , "");
    imgArray[35] = new portrait("smile36.gif", "撒娇" , "");
    imgArray[36] = new portrait("smile37.gif", "鼓掌" , "");
    imgArray[37] = new portrait("smile38.gif", "害羞" , "");
    imgArray[38] = new portrait("smile39.gif", "老大" , "");
    imgArray[39] = new portrait("smile40.gif", "欠揍" , "");
    imgArray[40] = new portrait("smile41.gif", "飞吻" , "");
    imgArray[41] = new portrait("smile42.gif", "工作忙" , "");
    imgArray[42] = new portrait("smile43.gif", "大哭" , "");
    imgArray[43] = new portrait("smile44.gif", "偷偷笑" , "");
    imgArray[44] = new portrait("smile45.gif", "送花给你" , "");
    imgArray[45] = new portrait("smile46.gif", "来，亲一个" , "");
    imgArray[46] = new portrait("smile47.gif", "拍桌子" , "");
    imgArray[47] = new portrait("smile48.gif", "拜拜" , "");
    imgArray[48] = new portrait("49.gif", "我是男生" , "");
    imgArray[49] = new portrait("50.gif", "我是女生" , "");
    imgArray[50] = new portrait("51.gif", "玫瑰" , "");
    imgArray[51] = new portrait("52.gif", "好爱你" , "");
    imgArray[52] = new portrait("53.gif", "心碎了" , "");
    imgArray[53] = new portrait("54.gif", "亲亲" , "");
    imgArray[54] = new portrait("55.gif", "NO" , "");
    imgArray[55] = new portrait("56.gif", "YES" , "");
	imgArray[56] = new portrait("57.gif", "握个手" , "");
	imgArray[57] = new portrait("58.gif", "到点了" , "");
	imgArray[58] = new portrait("59.gif", "音乐" , "");
	imgArray[59] = new portrait("60.gif", "CALL我" , "");
	imgArray[60] = new portrait("61.gif", "带血的刀" , "");
	imgArray[61] = new portrait("62.gif", "炸弹" , "");
	imgArray[62] = new portrait("63.gif", "有了" , "");
	imgArray[63] = new portrait("64.gif", "好晚了" , "");
	imgArray[64] = new portrait("65.gif", "吸血蝙蝠" , "");
	imgArray[65] = new portrait("66.gif", "便便" , "");
	imgArray[66] = new portrait("67.gif", "干一杯" , "");
	imgArray[67] = new portrait("68.gif", "抽烟" , "");
	imgArray[68] = new portrait("69.gif", "打电话" , "");
	imgArray[69] = new portrait("70.gif", "家" , "");
	imgArray[70] = new portrait("71.gif", "车子" , "");
	imgArray[71] = new portrait("72.gif", "礼物" , "");
	imgArray[72] = new portrait("73.gif", "金钱" , "");
	imgArray[73] = new portrait("74.gif", "太阳" , "");
	imgArray[74] = new portrait("75.gif", "下雨" , "");
	imgArray[75] = new portrait("76.gif", "猪猪" , "");
	imgArray[76] = new portrait("77.gif", "小猫" , "");
	imgArray[77] = new portrait("78.gif", "小狗" , "");
	imgArray[78] = new portrait("79.gif", "骨头" , "");
	imgArray[79] = new portrait("80.gif", "喝水" , "");
	imgArray[80] = new portrait("81.gif", "汉堡" , "");
	imgArray[81] = new portrait("82.gif", "包子" , "");
	imgArray[82] = new portrait("83.gif", "西瓜" , "");
	imgArray[83] = new portrait("84.gif", "约会" , "");


function drawSpace()
{
    sHTML +='</tr><tr align="left" bgcolor="#f8f8f8" class="unnamed1">';
}
function drawPortrat( index )
{
    if (index<0 || index>imgArray.length) return;
    var portratContent ='<img src="' + imagePath + imgArray[index].name + '" ' +
                        'alt="' + imgArray[index].alt + '" ' +
                        'width="' + imageWidth + '" ' + 
                        'height="' + imageHeight + '" >';
    sHTML +='<td align="center">';
    sHTML +=portratContent;
    sHTML +='</td>';
}
function drawPortratsHead()
{
	sHTMLHead = "";
    sHTMLHead +='<td colspan="' + countPerRow + '"  align="center"> <strong>表情</strong></td>';
	return sHTMLHead;
}
function drawPortrats()
{
    var i = 0;
	sHTML = "";
    for (i=0; i<imgArray.length; i++) {
        if (i>0 && i%countPerRow==0)    drawSpace();
        drawPortrat( i );
    }
	return sHTML;
}
function MouseClick( index )
{
    window.returnValue = imagePath + imgArray[index].name;
    window.close();
}