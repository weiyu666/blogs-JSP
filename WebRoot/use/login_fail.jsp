<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="javascript">alert("登录错误，请重新输入")</script>
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
</style>
</head>

<body>
<div style="position:absolute; width:400px;  height:240px; top:50%; margin-top:-120px; left:50%; margin-left:-200px; z-index:5000;">
<form id="form1" name="form1" method="post" action="checkin.jsp">
<table width="400" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="60" bgcolor="#D7E4EB" style="padding-left:20px; border-bottom:1px #A8CFE3 dotted;"><strong><font color="red">用户名密码错误，请重新输入</font></strong></td>
  </tr>
  <tr>
    <td height="50" bgcolor="#D7E4EB" style="padding-left:30px;"><strong>登录账户</strong>
    <input type="text" name="username" style="width:150px; margin-left:10px;"/>
   </td>
  </tr>
  <tr>
    <td height="50" bgcolor="#D7E4EB" style="padding-left:30px;"><strong>登录密码</strong>
    <input type="password" name="password" style="width:150px; margin-left:10px;"/>
    </td>
  </tr>
  <tr>
    <td height="20" align="right" valign="middle" bgcolor="#D7E4EB">&nbsp;</td>
  </tr>
  <tr>
    <td height="60" align="center" valign="top" bgcolor="#D7E4EB">
        <input type="submit" name="button" id="button" value="登录" style="margin-right:20px;"/>
        <a href="reg.jsp">注册新用户</a>
      </td>
  </tr>
</table>
</div>
</body>
</html>

