
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.blog.system.Dto.DailyBean,java.util.Date,com.blog.system.Dto.CommentBean,java.text.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>后台管理系统</title>
		<link href="system/style.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<!--TOP开始-->
		<table width="918" align="center" cellpadding="0" cellspacing="0"
			style="margin-top: 10px;">
			<tr>
				<td height="80" align="center" background="system/images/header.png"></td>
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
				<td valign="top"><br></td><td valign="top"><br></td><td align="right">
					<a href="#"><img src="system/images/out_login.png" width="52"
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
								<img src="system/images/iecool_arrow.gif" width="7" height="9"
									style="margin: 0 10px;" />
								详细信息
							</td>
						</tr>
					</table>
					<!--“当前位置”结束-->


					<!--“列表”开始-->
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="25" bgcolor="#FFFEE7">
								<span class="f12_0000" style="padding-left: 10px;"><strong>日志详细信息</strong><strong></strong>
								</span>
							</td>
						</tr>
					</table>
					<table width="100%" border="1" cellpadding="0" cellspacing="0"
						bordercolor="#CCCCCC" style="border-collapse: collapse;">
						<tr align="center" bgcolor="#FFFEE7">
						</tr>
						<%
							DailyBean db = (DailyBean) request.getAttribute("singledaily");
						%>
						<tr align="center">
							<td width="190" height="30" class="f12_484848">
								<strong>日志ID</strong>
							</td>
							<td align="left" class="f12_0000" style="padding-left: 10px;"><%=db.getDailyid()%></td>
						</tr>
						<tr align="center">
							<td width="190" height="30" class="f12_484848">
								<strong>日志标题</strong>
							</td>
							<td align="left" class="f12_0000" style="padding-left: 10px;"><%=db.getDailyname()%></td>
						</tr>
						<tr align="center">
							<td width="190" height="30" class="f12_484848">
								<strong>日志内容</strong>
							</td>
							<td align="left" class="f12_0000" style="padding-left: 10px;"><%=db.getDaily()%></td>
						</tr>
						<tr align="center">
							<td width="190" height="30" class="f12_484848">
								<strong>日志发表时间</strong>
							</td>
							<td align="left" class="f12_0000" style="padding-left: 10px;"><%=db.getPostingdate()%></td>
						</tr>
						<tr align="center">
							<td width="190" height="30" class="f12_484848">
								<strong>日志修改时间</strong>
							</td>
							<td align="left" class="f12_0000" style="padding-left: 10px;"><%=db.getModifytime()%></td>
						</tr>
					</table>
					<!--“列表”结束-->
					<!--“评论列表”开始-->
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						style="margin-top: 10px;">
						<tr>
							<td height="25" bgcolor="#FFFEE7">
								<span class="f12_0000" style="padding-left: 10px;"><strong>日志相关评论</strong>
								</span>
							</td>
						</tr>
					</table>
					<table width="100%" border="1" cellpadding="0" cellspacing="0"
						bordercolor="#CCCCCC"
						style="border-collapse: collapse; margin: 0px 0 5px 0;">
						<tr align="center" bgcolor="#FFFEE7">
							<td width="190" height="24" bgcolor="#FFFFFF" class="f12_0000">
								<strong>评论ID</strong>
							</td>
							<td width="190" bgcolor="#FFFFFF" class="f12_0000">
								<strong>评论内容</strong>
							</td>
							<td width="190" bgcolor="#FFFFFF" class="f12_0000">
								<strong>评论时间</strong>
							</td>
							<td bgcolor="#FFFFFF" class="f12_0000">
								<strong>操作</strong>
							</td>
						</tr>
						<%
							Collection comment = (Collection) request.getAttribute("comment");
							Iterator it = comment.iterator();
							while (it.hasNext()) {
								CommentBean cb = (CommentBean) it.next();
						%>
						<tr align="center">
							<td height="30" class="f12_0000">
								<%=cb.getCommentid()%>
							</td>
							<td class="f12_0000">
								<%=cb.getComment()%>
							</td>
							<td class="f12_0000">
								<%=cb.getCommenttime()%>
							</td>
							<td class="f12_408BAA">
								<a
									href="/blog/system/commentdo?param=del&commentid=<%=cb.getCommentid()%>">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="/blog/system/commentdo?param=singlecomment&commentid=<%=cb.getCommentid()%>">查看</a>
							</td>
						</tr>
						<%
							}
						%>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<div class="sabrosus">
										<%
											int page1 = Integer.parseInt(request.getAttribute("page")
													.toString());
											int size = Integer
													.parseInt(request.getAttribute("size").toString());
											int count = Integer.parseInt(request.getAttribute("count")
													.toString());
										%>
										<a href="/blog/system/dailycdo?dailyid=<%=db.getDailyid()%>&page=1">首页</a>
										<a
											href="/blog/system/dailycdo?dailyid=<%=db.getDailyid()%>&page=<%=page1 - 1%>">上一页</a>
										<a
											href="/blog/system/dailycdo?dailyid=<%=db.getDailyid()%>&page=<%=page1 + 1%>">下一页</a>
										<a
											href="/blog/system/dailycdo?dailyid=<%=db.getDailyid()%>&page=<%=(count - 1) / size + 1%>">末页</a>
									</div>
								</td>
								<form id="form01"
									action="/blog/system/dailycdo?dailyid=<%=db.getDailyid()%>&page=">
								<td width="300" align="center" class="f12_0000">
									转到第
									<input name="page" type="text" class="select2" size="3"
										style="margin: 0 5px;" />
									页
									<a href="#" onclick="document.all.form01.submit();">
									<img src="system/images/go.gif" align="absmiddle" border="0"
											style="margin: 0 3px;" /> </a> 当前<%=page1%>/<%=(count - 1) / size + 1%>
									共<%=count%>条记录
								</td>
							</tr>
						</table>

				</td>
			</tr>
		</table>
		<!--main结束-->
	</body>
</html>
