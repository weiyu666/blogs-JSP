<%@ page language="java"  import="java.util.*,com.blog.system.Dto.*" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>BLOG</title>
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="./js/regTest.js">flag[0]=1</script>
	</head>

	<body>
	<%UserBean ub = (UserBean)request.getAttribute("singleuser");
		String userid = (String)request.getAttribute("userid");
		  int userid1= Integer.parseInt(userid);
			int userid2;
			if (session.getAttribute("viewuserid") == null) {
				userid2 = 0;
			} else {
				userid2 = (Integer) session.getAttribute("viewuserid");
			}%>
		<table width="750" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="95" class="ftt" style="padding: 20px 0px 0px 30px;">
					<strong><%=ub.getBlogname() %></strong>
				</td>
				<td width="320" class="f14_ff" style="padding: 20px 0px 0px 20px;">
					<strong>     <img src="images/icon_daily.png" width="15" height="13" align="absmiddle" style="margin-right:5px;"/><a href="dailydo?userid=<%=ub.getUserid() %>">日志</a>
    <img src="images/icon_pics.png" width="16" height="16" align="absmiddle" style="margin:0px 5px 0px 10px;" /><a href="photoalbumlistdo?userid=<%=ub.getUserid() %>">相册</a>
    <img src="images/icon_message.png" width="15" height="16" align="absmiddle" style="margin:0px 5px 0px 10px;"/><a href="messagedo?blogid=<%=ub.getUserid() %>">留言</a>
    <%if(userid1==userid2){ %><img src="images/icon_infor.png" width="16" height="16" align="absmiddle" style="margin:0px 5px 0px 10px;"/><a href="userdo?param=singleuser&userid<%=userid %>">个人资料</a> <%} %></strong>
				</td>
			</tr>
		</table>
		<table width="789" border="0" align="center" cellpadding="0"
			cellspacing="0" style="margin-top: -25px;">
			<tr>
				<td height="30" background="images/p_1.png">
					&nbsp;
				</td>
			</tr>
		</table>

		<table width="789" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td valign="top" background="images/p_2.png">

					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="left" valign="top">
								<form name="upform" action="userdo?param=update&userid=<%=ub.getUserid()%>" method="post">
									<table width="85%" border="0" align="right" cellpadding="0"
										cellspacing="0">
										<tr>
											<td height="30">
												<strong class="f14_000">个人资料修改</strong><br></td>
										</tr>
										<tr>
											<td height="6">
												<img src="images/line.png" width="425" height="6" />
											</td>
										</tr>
										<tr>
											<td height="50" class="f12_000">
												<strong>请输入要修改的信息</strong><strong></strong>
											</td>
										</tr>
										<tr>
											<td width="250" align="left" valign="middle" class="f12_blue">博客名：&nbsp; 
											<br/><input type="text" name="blogname" value="<%=ub.getBlogname() %>"/></td>
										</tr>
										<tr>
											<td width="250" align="left" valign="middle" class="f12_blue">昵称：&nbsp;&nbsp;&nbsp; 
											<br/><input type="text" name="nickname" value="<%=ub.getNickname() %>"/></td>
										</tr>
										<tr>
											<td width="250" align="left" valign="middle" class="f12_blue">E-MAIL：&nbsp; 
											<br/><input type="text" name="email" value="<%=ub.getEmail() %>"/></td>
										</tr>
										<tr>
											<td width="250" align="left" valign="middle" class="f12_blue">新密码：<span id="passWord_note"></span>&nbsp; 
											<br/><input type="text" name="password1" id="password1" onblur="checkPassword(this.value);"/></td>
										</tr>
										<tr>
											<td width="250" align="left" valign="middle" class="f12_blue">确认密码：<span id="SecondPassword_note"></span>
											<br/><input type="text" name="password2" id="password2" onblur="checkrepassword(this.value);"/></td>
										</tr>
										<tr>
											<td height="50" align="right">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td>
															&nbsp;
														</td>
														<td width="67" height="18" align="center" class="f12_000">
															<input type="submit" name="submit" value="提交修改" />
														</td>
														<td width="10">
															&nbsp;
														</td>
														
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</form>
							</td>
							<td width="260" valign="top">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="300" align="left" valign="top"
											style="background: url(images/left1_bg.png) top no-repeat;">

											<table width="70%" border="0" align="center" cellpadding="0"
												cellspacing="0" style="margin-top: 40px;">
												<tr></tr>
												<tr>
													<td height="80" align="center"
														background="images/pics_bg.png"
														style="background-repeat: no-repeat; background-position: center;">
														<img src="img/02.jpg" width="48" height="48" />
													</td>
												</tr>
												<tr>
													<td height="25" align="center" class="f12_000"
														style="border-bottom: 1px #FFFFBE dotted;">
														<strong><br></strong>
													</td>
												</tr>
												<tr>
													<td height="30" class="f12_000" style="padding-left: 10px;">
														昵称：<%=ub.getNickname() %>
													</td>
												</tr>
												<tr>
													<td height="30" class="f12_000" style="padding-left: 10px;"><br></td>
												</tr>
												<tr>
													<td height="30" class="f12_000" style="padding-left: 10px;"><a href="bloglistdo">返回博客系统主页</a><br></td>
												</tr>
												<tr>
													<td height="30" class="f12_000" style="padding-left: 10px;"><br></td>
												</tr>
											</table>

										</td>
									</tr>
								</table>
														<table width="75%" height="510" border="0" align="center"
									cellpadding="0" cellspacing="0" style="margin-top: 9px;">

								</table>
										</td>
									</tr>
								</table>

							</td>
						</tr>
					</table>
		<table width="809" border="0" align="center" cellpadding="0"
			cellspacing="0"
			style="background: url(images/foot_bg.png) no-repeat 8px 0;">
			<tr>
				<td height="92" valign="top">

					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						style="margin-top: 4px;">
						<tr>
							<td height="30" align="center" valign="middle" class="f12_000">陈巍瑜 版权所有<br></td>
						</tr>
					</table>

				</td>
			</tr>
		</table>
	</body>
</html>
