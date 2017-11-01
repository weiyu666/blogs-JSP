<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BLOG</title>
<script language="javascript" src="./js/regTest.js"></script>
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
	width:400px;
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
</head>

<body>
 <form id="form1" name="form1" method="post" action="userdo?param=reg">
<table width="400" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="60" bgcolor="#D7E4EB" style="padding-left:20px; border-bottom:1px #A8CFE3 dotted;"><strong>陈巍瑜的BLOG会员注册</strong></td>
  </tr>
  <tr>
    <td height="20" valign="top" bgcolor="#D7E4EB"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="100" height="40" align="right"><strong>博客名</strong></td>
        <td>
          <input type="text" name="blogname" id="blogname" style="width:150px; margin-left:10px;"/>
       </td>
      </tr>

      <tr>
        <td width="100" height="40" align="right"><strong>用户名</strong></td>
        <td><input type="text" name="username" id="username" style="width:150px; margin-left:10px;" onblur="checkUsername(this.value);"/>
        <span id="userName_note">4个以上英文或者数字</span></td>
        </tr>
      <tr>
        <td width="100" height="40" align="right"><strong>账户密码</strong></td>
        <td><input type="password" name="password1" id="password1" style="width:150px; margin-left:10px;" onblur="checkPassword(this.value);"/><span id="passWord_note">6个以上数字或者英文</span></td>
        </tr>
      <tr>
        <td width="100" height="40" align="right"><strong>密码确认</strong></td>
        <td><input type="password" name="password2" id="password2" style="width:150px; margin-left:10px;" onblur="checkrepassword(this.value);"/><span id="SecondPassword_note">6个以上数字或者英文</span></td>
        </tr>
      <tr>
        <td width="100" height="40" align="right"><strong>电子邮件</strong></td>
        <td><input type="text" name="email" id="email" style="width:150px; margin-left:10px;"/></td>
        </tr>
      <tr>
        <td width="100" height="40" align="right"><strong>昵称</strong></td>
        <td><input type="text" name="nickname" id="nickname" style="width:150px; margin-left:10px;"/></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td height="60" align="center" valign="middle" bgcolor="#D7E4EB"><input type="submit" name="button" id="button" value="提交注册" style="margin-right:20px;" onclick="return registSubmit();"/>
    </td>
  </tr>
</table>
</body>
</html>

