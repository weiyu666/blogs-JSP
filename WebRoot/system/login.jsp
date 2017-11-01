<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理系统</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	background-color: #0C61A4;
}
-->
</style>
<link href="*.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form method="post" action="checkin.jsp">
<table width="918" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="390" valign="top" background="images/reg_bg.jpg" bgcolor="#FFFEE7">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:170px;">
      <tr>
        <td width="385" height="40" align="right" class="f12_ffff" style="padding-right:10px;">登陆名称</td>
        <td><label> <input name="adminname" type="text"/> </label>
       </td>
      </tr>
      <tr>
        <td width="385" height="40" align="right" class="f12_ffff" style="padding-right:10px;">登陆密码</td>
        <td><label> <input name="password" type="password"/> </label>
         <input type="image" src="images/btn_reg.png" width="49" height="18" align="absmiddle" style="margin-left:10px;"/></td>
      </tr>
    </table>
    </td>
  </tr>
</table>
</body>
</html>