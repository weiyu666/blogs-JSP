<%@ page language="java" import="java.util.*,com.blog.system.Dto.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BLOG</title>
<style type="text/css">
body{
	font-family:"Lucida Grande", "Lucida Sans Unicode", Verdana, Arial, Helvetica, sans-serif;
	font-size:12px;
	background-color: #357580;
	background-image:url(images/reg_bg.png);
	background-position:center 0px;
	background-repeat:no-repeat;
}
p, h1, form, button{border:0; margin:0; padding:0;}
.spacer{clear:both; height:1px;}
/* ----------- My Form ----------- */
.myform{
	margin:0 auto;
	width:900px;
	padding:14px;
}
	
	/* ----------- stylized ----------- */
	#stylized{
		border:solid 1px #000000;
		background:#ebf4fb;
	}
	#stylized h1 {
		font-size:14px;
		font-weight:bold;
		margin-bottom:8px;
	}
	#stylized p{
		font-size:12px;
		color:#666666;
		margin-bottom:20px;
		border-bottom:solid 1px #b7ddf2;
		padding-bottom:10px;
	}
	#stylized label{
		display:block;
		font-weight:bold;
		text-align:right;
		width:140px;
		float:left;
	}
	#stylized .small{
		color:#666666;
		display:block;
		font-size:12px;
		font-weight:normal;
		text-align:right;
		width:140px;
	}
	#stylized input{
		float:left;
		font-size:12px;
		padding:4px 2px;
		border:solid 1px #aacfe4;
		width:200px;
		margin:2px 0 20px 10px;
	}
	#stylized button{ 
		clear:both;
		margin-left:150px;
		width:125px;
		height:31px;
		background:#666666 url(img/button.png) no-repeat;
		text-align:center;
		line-height:31px;
		color:#FFFFFF;
		font-size:12px;
		font-weight:bold;
	}
</style>
<link href="css/style_1.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="stylized" class="myform" style="filter:Alpha(opacity=90); margin-top:10px;">
 <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="40"  style="border-bottom:1px #CCC dotted;"><strong><font size="+2">BLOG</font></strong>&nbsp;&nbsp;&nbsp;&nbsp;相逢的人会再相逢<br /></td>
    <td width="350" align="right"  style="border-bottom:1px #CCC dotted;"><a href="login.jsp">登录</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="reg.jsp">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="images/1.png" width="16" height="16" align="absmiddle" style="margin-right:5px;"/>开发者：<strong>陈巍瑜</strong>&nbsp;&nbsp;&nbsp;<strong></strong></td>
  </tr>
  <tr>
    <td height="30" align="left" valign="middle"  style="border-bottom:1px #CCC dotted;">欢迎来到个人博客系统~</td>
    <td align="right" valign="middle"  style="border-bottom:1px #CCC dotted;">
    <div id="jnkc" style=" background-image:url(images/aud_3_icon3.png); background-repeat:no-repeat; height:30px; padding-left:26px; padding-top:3px; margin-bottom:5px; margin-left:10px;">
            </div>
    <script>setInterval("jnkc.innerHTML=new Date().toLocaleString()+' &nbsp;&nbsp;星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);</script></td>
  </tr>
  </table>
 <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
 <%
							Collection user = (Collection) request.getAttribute("user");
							Iterator it = user.iterator();
							while (it.hasNext()) {
								UserBean ub = (UserBean) it.next();
			%>
   <tr>
     <td width="500" height="35" class="f14_000"><a href="indexdo?userid=<%=ub.getUserid()%>"><%=ub.getBlogname() %></a></td>
     <td width="150"><%=ub.getNickname() %></td>
     <td width="150"><%=ub.getRegtime() %></td>
   </tr>
   <%} %>
 </table>
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="right">
								
								<%
								int page1 = Integer.parseInt(request.getAttribute("page").toString());
								int size = Integer.parseInt(request.getAttribute("size").toString());
								int count = Integer.parseInt(request.getAttribute("count").toString());
								%>
										<a href="bloglistdo?page=1">首页</a>
										<%if (page1>1){ %><a href="bloglistdo?page=<%=page1-1%>"><%} %>上一页<%if (page1>1){ %></a><%} %>
										<%if (page1<((count-1)/size+1)){ %><a href="bloglistdo?page=<%=page1+1%>"><%} %>下一页<%if (page1<((count-1)/size+1)){ %></a><%} %>
										<a href="bloglistdo?page=<%=(count-1)/size+1%>">末页</a>
							
							</td>
							<form id="form01" action="bloglistdo?page=">
							<td valign="top"><br /></td><td width="450" align="center" class="f12_0000">
							
								当前<%=page1%>/<%=(count-1)/size+1%> 共<%=count%>条记录
							</td>
						</tr>
					</table>
</div>
</body>
</html>
