<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.text.*,java.util.*,java.sql.*"%>
<%@ page import="com.blog.system.Dto.UserBean"%>
<%@ page import="com.blog.system.Dao.*"  %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>后台管理系统</title>
		<link href="/blog/system/style.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<!--TOP开始-->
		<table width="918" align="center" cellpadding="0" cellspacing="0"
			style="margin-top: 10px;">
			<tr>
				<td height="80" align="center" background="images/header.png"></td>
			</tr>
		</table>
		<!--TOP结束-->

		<!--“登录退出栏”开始-->
		<table width="918" border="0" align="center" cellpadding="0"
			cellspacing="0" bgcolor="f0f0e5">
			<tr>
				<td width="150" height="30" align="left" class="f12_0000"
					style="padding-left: 25px;"> 
					管理员：<%=session.getAttribute("adminname") %>
				</td>
				<td width="255" align="left" class="f12_0000">
					当前时间为：<%SimpleDateFormat dateformat=new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");   
        String nowtime=dateformat.format(new java.util.Date());%>
        <%=nowtime %>
				</td>
				<td align="right">
					<a href="#"><img src="images/out_login.png" width="52"
							height="17" align="absmiddle" border="0"
							style="margin-right: 20px;" /> </a>
				</td>
			</tr>
		</table>
		<!--“登录退出栏”结束-->


		<!--main开始-->
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
					<!--“左侧导航”结束-->
				</td>
				<td valign="top">

					<!--“当前位置”开始-->
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="28" bgcolor="#3F80C0" class="f12_ffff"
								style="padding-left: 10px;">
								用户管理
								<img src="images/iecool_arrow.gif" width="7" height="9"
									style="margin: 0 10px;" />
								用户列表
							</td>
						</tr>
					</table>
					<!--“当前位置”结束-->

					<!--“搜索、添加”开始-->
					<!--“搜索、添加”结束-->

					<!--“列表”开始-->
					<table width="100%" border="1" cellpadding="0" cellspacing="0"
						bordercolor="#CCCCCC" style="border-collapse: collapse;">
						<tr align="center" bgcolor="#FFFEE7">
							<td width="150" height="25" class="f12_0000">
								<strong>用户ID</strong>
							</td>
							<td width="150" class="f12_0000">
								<strong>用户名</strong>
							</td>
							<td width="150" class="f12_0000">
								<strong>博客名</strong>
							</td>
							<td width="150" class="f12_0000">
								<strong>创建时间</strong>
							</td>
							<td class="f12_0000">
								<strong>操作</strong>
							</td>
						</tr>
						<%
							Collection user = (Collection) request.getAttribute("user");
							Iterator it = user.iterator();
							while (it.hasNext()) {
								UserBean ub = (UserBean) it.next();
						%>

						<tr align="center">
							<td height="30" class="f12_0000">
								<%=ub.getUserid()%>
							</td>
							<td class="f12_0000">
								<%=ub.getUsername()%>
							</td>
							<td class="f12_0000">
								<%=ub.getBlogname()%>
							</td>
							<td class="f12_0000">
								<%=ub.getRegtime()%>
							</td>
							<td class="f12_408BAA">
								<a href="/blog/system/userdo?param=del&userid=<%=ub.getUserid()%>">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="/blog/system/userdo?param=singleuser&userid=<%=ub.getUserid()%>">查看</a>
							</td>
						</tr>
						<%
							}
						%>
					</table>
					<!--“列表”结束-->

					<!--“分页器”开始-->
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<div class="sabrosus">
								<%
								int page1 = Integer.parseInt(request.getAttribute("page").toString());
								int size = Integer.parseInt(request.getAttribute("size").toString());
								int count = Integer.parseInt(request.getAttribute("count").toString());
								%>
										<a href="/blog/system/userdo?param=view&page=1">首页</a>
										<a href="/blog/system/userdo?param=view&page=<%=page1-1%>">上一页</a>
										<a href="/blog/system/userdo?param=view&page=<%=page1+1%>">下一页</a>
										<a href="/blog/system/userdo?param=view&page=<%=(count-1)/size+1%>">末页</a>
								</div>
							</td>
							<form id="form01" action="/blog/system/userdo?param=view&page=">
							<td valign="top"><br /></td><td width="450" align="center" class="f12_0000">
								转到第
								<input type="text" class="select2" size="3"
									style="margin: 0 5px;" name="page"/>
								页
								<a href="#" onclick="document.all.form01.submit();">
								<img src="images/go.gif" align="absmiddle"	border="0" style="margin: 0 3px;" /> </a> 
								当前<%=page1%>/<%=(count-1)/size+1%> 共<%=count%>条记录
							</td>
						</tr>
					</table>
					<!--“分页器”结束-->


				</td>
			</tr>
		</table>
		<!--main结束-->
	</body>
</html>
