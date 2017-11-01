<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BLOG系统用户注册</title>
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
 h1, form, button{border:0; margin:0; padding:0;}

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
<div id="stylized" class="myform" style="filter:Alpha(opacity=90); margin-top:20px;">
  <form id="form1" name="form1" method="post" action="userdo?param=reg">
    <h1> 个人BLOG系统 会员注册</h1>
    <label>博客名
        <span class="small">8-12个字数或者英文字母</span>
    </label>
    <input type="text" name="blogname"/>
    
    <label>博客IN签名
        <span class="small">6-12个字符</span>
    </label>
    <input type="text" name="blogsign"/>
    
    <label>用户名
        <span class="small"  id="userName_note">4-10个英文或者中文</span>
    </label>
    <input type="text" name="username"  onblur="checkUsername(this.value);"/>
    <label>用户昵称
        <span class="small">10个以内英文或者中文</span>
    </label>
    <input type="text" name="nickname"/>
    
    <label>账户密码
        <span class="small" id="passWord_note">6-12个数字或者英文字母</span>
    </label>
    <input type="password" name="password1" id="password1" onblur="checkPassword(this.value);"/>
    
    <label>确认密码
        <span class="small" id="SecondPassword_note">6-12个数字或者英文字母</span>
    </label>
    <input type="password" name="password2" id="password2" onblur="checkrepassword(this.value);"/>


	<label>电子邮件
        <span class="small">请输入您的电子邮件</span>
    </label>
    <input type="text" name="email"/>


    <button  type="submit" onclick="return registSubmit();">提交注册</button>
  </form>
</div>
</body>
</html>
