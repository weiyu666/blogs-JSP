<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

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
<div style="position:absolute; width:430px;  height:280px; top:50%; margin-top:-160px; left:50%; margin-left:-215px;">
<div id="stylized" class="myform" style="filter:Alpha(opacity=90);">
  <form id="form1" name="form1" method="post" action="checkin.jsp">
    <h1> BLOGÏµÍ³µÇÂ¼</h1>
    <label>µÇÂ¼ÕË»§
        <span class="small">Add your name</span>
    </label>
    <input type="text" name="username"  style="background-image:url(images/username.gif); background-position:left; background-repeat:no-repeat; padding-left:20px; width:180px;"/>
    
    <label>µÇÂ¼ÃÜÂë
        <span class="small">Add your password</span>
    </label>
    <input type="password" name="password" style="background-image:url(images/password.gif); background-position:left; background-repeat:no-repeat; padding-left:20px; width:180px;"/>

    <button  type="submit" name="submit">µÇÂ¼</button>&nbsp;&nbsp;&nbsp;&nbsp;<span class=" f12_000"><a href="reg.jsp">×¢²áÐÂÓÃ»§</a></span>
    <div class="spacer"></div>

  </form>
</div>
</div>
  </body>
</html>
