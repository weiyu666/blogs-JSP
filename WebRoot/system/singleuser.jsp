<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.blog.system.Dto.UserBean"%>
<%@page import="java.util.Date,java.text.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理系统</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<!--TOP开始-->
<table width="918" align="center" cellpadding="0" cellspacing="0" style=" margin-top:10px;">
  <tr>
    <td height="80" align="center" background="images/header.png" ></td>
  </tr>
</table>
<!--TOP开始-->

<!--“登录退出栏”开始-->
<table width="918"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="f0f0e5">
  <tr>
    <td width="150" height="30" align="left" class="f12_0000" style="padding-left:25px;">管理员：<%=session.getAttribute("adminname") %></td>
    <td width="300" align="left" class="f12_0000">当前时间为：<%SimpleDateFormat dateformat=new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");   
        String nowtime=dateformat.format(new Date());%>
        <%=nowtime %></td>
    <td align="right"><a href="#"><img src="images/out_login.png" width="52" height="17" align="absmiddle" border="0" style="margin-right:20px; "/></a></td>
  </tr>
</table>
<!--“登录退出栏”结束-->


<!--main开始-->
<table width="918" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="150" valign="top" bgcolor="#FFFFFF">		<table width="918" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="150" valign="top" bgcolor="#F0F0E5">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" bgcolor="#336699" class="f14_ffff">用户管理</td>
      </tr>
      <tr>
        <td height="30" align="center" class="f12_0000"><a href="/blog/system/userdo" target="_self">用户列表</a></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" bgcolor="#336699" class="f14_ffff">日志管理</td>
      </tr>
      <tr>
        <td height="30" align="center" class="f12_0000"><a href="/blog/system/dailydo" target="_self">日志列表</a></td>
      </tr>
     </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" bgcolor="#336699" class="f14_ffff">图片管理</td>
      </tr>
      <tr>
        <td height="30" align="center" class="f12_0000"><a href="/blog/system/photodo" target="_self">图片列表</a></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" bgcolor="#336699" class="f14_ffff">评论管理</td>
      </tr>
      <tr>
        <td height="30" align="center" class="f12_0000"><a href="/blog/system/commentdo" target="_self">评论列表</a></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" bgcolor="#336699" class="f14_ffff">留言管理</td>
      </tr>
      <tr>
        <td height="30" align="center" class="f12_0000"><a href="messagedo" target="_self">留言列表</a></td>
      </tr>
    </table>
    </td>
    <td valign="top">
	
    <!--“当前位置”开始-->	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="28" bgcolor="#3F80C0" class="f12_ffff" style="padding-left:10px;">
      权限管理<img src="images/iecool_arrow.gif" width="7" height="9" style="margin:0 10px; "/>详细信息</td>
      </tr>
    </table>  
	 <!--“当前位置”结束-->  
	
	  
	  <!--“列表”开始-->
	  <table width="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse;">
        <tr align="center" bgcolor="#FFFEE7" >
          <td height="25" colspan="2" align="left"  class="f12_0000" style="padding-left:10px;">
          <strong>用户详细信息</strong></td>
        </tr>
        	<%
							UserBean ub = (UserBean) request.getAttribute("singleuser");
			%>
        <tr align="center">
          <td width="100" height="30" class="f12_484848"><strong>用户名</strong></td>
          <td align="left" class="f12_0000" style="padding-left:10px;"><%=ub.getUsername() %></td>
        </tr>
        <tr align="center">
          <td width="100" height="30" class="f12_484848"><strong>博客名</strong></td>
          <td align="left" class="f12_0000" style="padding-left:10px;"><%=ub.getBlogname() %></td>
        </tr>
        <tr align="center">
          <td width="100" height="30" class="f12_484848"><strong>博客签名</strong></td>
          <td align="left" class="f12_0000" style="padding-left:10px;"><%=ub.getBlogsign() %></td>
        </tr>
        <tr align="center">
          <td width="100" height="30" class="f12_484848"><strong>最后登陆时间</strong></td>
          <td align="left" class="f12_0000" style="padding-left:10px;"><%=ub.getLastlogin() %></td>
        </tr>
        <tr align="center">
          <td width="100" height="30" class="f12_484848"><strong>姓名</strong></td>
          <td align="left" class="f12_0000" style="padding-left:10px;"><%=ub.getName() %></td>
        </tr>
        <tr align="center">
          <td width="100" height="30" class="f12_484848"><strong>性别</strong></td>
          <td align="left" class="f12_0000" style="padding-left:10px;"><%int a= ub.getSex();
          																switch(a){
          																case 0:%>保密
          																<% break;
          																case 1:%>男
          																<%break;
          																case 2:%>女<%break;} %></td>
        </tr>
        <tr align="center">
          <td width="100" height="30" class="f12_484848"><strong>省份</strong></td>
          <td align="left" class="f12_0000" style="padding-left:10px;"><%=ub.getProvince() %></td>
        </tr>
        <tr align="center">
          <td width="100" height="30" class="f12_484848"><strong>城市</strong></td>
          <td align="left" class="f12_0000" style="padding-left:10px;"><%=ub.getCity() %></td>
        </tr>
        <tr align="center">
          <td width="100" height="30" class="f12_484848"><strong>地址</strong></td>
          <td align="left" class="f12_0000" style="padding-left:10px;"><%=ub.getAddress() %></td>
        </tr>
        <tr align="center">
          <td width="100" height="30" class="f12_484848"><strong>生日</strong></td>
          <td align="left" class="f12_0000" style="padding-left:10px;"><%=ub.getBirthday() %></td>
        </tr>
        <tr align="center">
          <td width="100" height="30" class="f12_484848"><strong>E-mail</strong></td>
          <td align="left" class="f12_0000" style="padding-left:10px;"><%=ub.getEmail() %></td>
        </tr>
        <tr align="center">
          <td width="100" height="30" class="f12_484848"><strong>联系电话</strong></td>
          <td align="left" class="f12_0000" style="padding-left:10px;"><%=ub.getTel() %></td>
        </tr>
        <tr align="center">
          <td width="100" height="30" class="f12_484848"><strong>注册时间</strong></td>
          <td align="left" class="f12_0000" style="padding-left:10px;"><%=ub.getRegtime() %></td>
        </tr>
        <tr align="center">
          <td width="100" height="30" class="f12_484848"><strong>个人简介</strong></td>
          <td align="left" class="f12_0000" style="padding-left:10px;"><%=ub.getProfile() %></td>
        </tr>
      </table>	
	  <!--“列表”结束-->
	  
	  <!--“分页器”开始-->
	  <!--“分页器”结束-->  
	   
	   
    </td>
  </tr>
</table>
<!--main结束-->
</body>
</html>
