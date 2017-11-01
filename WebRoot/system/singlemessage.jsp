<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.text.*,java.util.*,com.blog.system.Dto.*,java.util.Date,com.blog.system.Dto.CommentBean"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>后台管理系统</title>
		<link href="style.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		
		<!--TOP开始-->
		<table width="918" align="center" cellpadding="0" cellspacing="0"
			style="margin-top: 10px;">
			<tr>
				<td height="80" align="center" background="images/header.png"></td>
			</tr>
		</table>
		<!--TOP开始-->

		<!--“登录退出栏”开始-->
		<table width="918" border="0" align="center" cellpadding="0"
			cellspacing="0" bgcolor="f0f0e5">
			<tr>
				<td width="150" height="30" align="left" class="f12_0000"
					style="padding-left: 25px;">
					管理员：<%=session.getAttribute("adminname") %>
				</td>
				<td width="300" align="left" class="f12_0000">
					当前时间为：<%SimpleDateFormat dateformat=new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");   
        String nowtime=dateformat.format(new Date());%>
        <%=nowtime %></td>
				<td align="right">
					<a href="#"><img src="images/out_login.png" width="52"
							height="17" align="absmiddle" border="0"
							style="margin-right: 20px;" /> </a>
				</td>
			</tr>
		</table>
		<!--“登录退出栏”结束-->


		<!--main开始-->
		<table width="918" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="150" valign="top" bgcolor="#FFFFFF">
							<table width="918" border="0" align="center" cellpadding="0" cellspacing="0">
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

					<!--“当前位置”开始-->
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="28" bgcolor="#3F80C0" class="f12_ffff"
								style="padding-left: 10px;">
								权限管理
								<img src="images/iecool_arrow.gif" width="7" height="9"
									style="margin: 0 10px;" />
								详细信息
							</td>
						</tr>
					</table>
					<!--“当前位置”结束-->


					<!--“列表”开始-->
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="25" bgcolor="#FFFEE7"><strong>&nbsp;评论详细内容</strong><span class="f12_0000" style="padding-left: 10px;"><strong></strong><strong></strong><strong></strong></span><br></td>
						</tr>
					</table>
					<table width="100%" border="1" cellpadding="0" cellspacing="0"
						bordercolor="#CCCCCC" style="border-collapse: collapse;">
						<tr align="center" bgcolor="#FFFEE7">
						</tr>
						<%
							MessageBean mb = (MessageBean) request.getAttribute("singlemessage");
						%>
						<tr align="center">
							<td width="190" height="30" class="f12_484848">
								<strong>留言ID</strong>
							</td>
							<td align="left" class="f12_0000" style="padding-left: 10px;"><%=mb.getMessageid()%></td>
						</tr>
						<tr align="center">
							<td width="190" height="30" class="f12_484848">
								<strong>留言内容</strong>
							</td>
							<td align="left" class="f12_0000" style="padding-left: 10px;"><%=mb.getMessage()%></td>
						</tr>
						<tr align="center">
							<td width="190" height="30" class="f12_484848">
								<strong>留言时间时间</strong>
							</td>
							<td align="left" class="f12_0000" style="padding-left: 10px;"><%=mb.getMessagetime()%></td>
						</tr>
						<tr align="center">
							<td width="190" height="30" class="f12_484848">
								<strong>被留言博客ID</strong>
							</td>
							<td align="left" class="f12_0000" style="padding-left: 10px;"><%=mb.getBlogid()%></td>
						</tr>
						<tr align="center">
							<td width="190" height="30" class="f12_484848">
								<strong>留言人ID</strong>
							</td>
							<td align="left" class="f12_0000" style="padding-left: 10px;"><%=mb.getUserid()%></td>
						</tr>
					</table>
					<!--“列表”结束-->
					

				</td>
			</tr>
		</table>
		<!--main结束-->
	</body>
</html>
