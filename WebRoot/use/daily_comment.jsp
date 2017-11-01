<%@ page language="java" import="java.util.*,com.blog.system.Dto.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BLOG</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%
	String userid = (String) request.getAttribute("userid");
	int userid2 = Integer.parseInt(userid);
	int userid1;
	if (session.getAttribute("viewuserid") == null) {
		userid1 = 0;
	} else {
		userid1 = (Integer) session.getAttribute("viewuserid");
	}
	UserBean ub = (UserBean) request.getAttribute("userinfo");
	DailyBean db = (DailyBean) request.getAttribute("singledaily");
	int page1 = Integer.parseInt(request.getAttribute("page")
			.toString());
	int size = Integer
			.parseInt(request.getAttribute("size").toString());
	int count = Integer.parseInt(request.getAttribute("count")
			.toString());
%>
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="95" class="ftt" style="padding:20px 0px 0px 30px;"><strong><%=ub.getBlogname()%></strong></td>
    <td width="320" class="f14_ff" style="padding:20px 0px 0px 20px;">
    <strong>
        <img src="images/icon_daily.png" width="15" height="13" align="absmiddle" style="margin-right:5px;"/><a href="dailydo?userid=<%=db.getUserid()%>">日志</a>
    <img src="images/icon_pics.png" width="16" height="16" align="absmiddle" style="margin:0px 5px 0px 10px;" /><a href="photoalbumlistdo?userid=<%=db.getUserid()%>">相册</a>
    <img src="images/icon_message.png" width="15" height="16" align="absmiddle" style="margin:0px 5px 0px 10px;"/><a href="messagedo?blogid=<%=db.getUserid()%>">留言</a>
    <%if(userid2==userid1){ %><img src="images/icon_infor.png" width="16" height="16" align="absmiddle" style="margin:0px 5px 0px 10px;"/><a href="userdo?param=singleuser&userid=<%=db.getUserid() %>">个人资料</a><%}%>
    </strong></td>
  </tr>
</table>

<table width="789" border="0" align="center" cellpadding="0" cellspacing="0" style=" margin-top:-25px;">
  <tr>
    <td height="30" background="images/p_1.png" >&nbsp;</td>
  </tr>
</table>
<table width="789" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td valign="top" background="images/p_2.png">
    <form method="post" action="/blog/use/dailycdo?param=add&userid1=<%=userid1 %>"> 
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" valign="top"><table width="85%" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30"><strong class="f12_000">共&nbsp;&nbsp;<font color="#FF3300"><%=count%></font>&nbsp;&nbsp;条留言</strong></td>
          </tr>
          <tr>
            <td height="30"><strong class="f14_000"><%=db.getDailyname()%></strong></td>
          </tr>
          <tr>
            <td height="6"><img src="images/line.png" width="425" height="6" /></td>
          </tr>
          <tr>
            <td height="50" align="left" valign="top" class="f12_t"><p><%=db.getDaily()%></td>
          </tr>
          <tr>
            <td height="25" align="right" valign="middle" class="f12_000" style="padding-right:10px;"><%=db.getPostingdate()%></td>
          </tr>
          <tr>
            <td height="20"><img src="images/line.png" width="425" height="6" /></td>
          </tr>
									<%
										Collection comment = (Collection) request.getAttribute("comment");
										Iterator it = comment.iterator();
										int i = count - (page1 - 1) * size;
										while (it.hasNext()) {
											CommentBean cb = (CommentBean) it.next();
									%>
		<tr>
            <td height="30" class="f12_t" style="border-bottom:1px #000 dotted;">第<%=i--%>楼：<%=cb.getCommentname()%> <%=cb.getCommenttime()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <%if(userid2==userid1){ %><a href="dailycdo?param=del&dailyid=<%=db.getDailyid() %>&commentid=<%=cb.getCommentid() %>">删除</a><%} %> </td>
          </tr>
          <tr>
            <td height="50" class="f12_000"><%=cb.getComment()%> </td>
          </tr>
          <%
          	}
          %>
          <tr>
            <td height="30" align="right" class="f12_000">
            <img src="images/arrow_1.png" width="13" height="12" align="absmiddle" />
            <%if (page1>1){ %><a href="dailycdo?dailyid=<%=db.getDailyid()%>&page=<%=page1 - 1%>"><%} %>上一页<%if (page1>1){ %></a><%} %>&nbsp;&nbsp;&nbsp;&nbsp;
            <%if (page1<((count-1)/size+1)){ %><a href="dailycdo?dailyid=<%=db.getDailyid()%>&page=<%=page1 + 1%>"><%} %>下一页<%if (page1<((count-1)/size+1)){ %></a><%} %>
            <img src="images/arrow_2.png" width="13" height="12" align="absmiddle" /></td>
          </tr>
          <tr>
            <td height="40" class="f14_000" style="background:url(images/line.png) left bottom no-repeat;"><strong>发表留言</strong></td>
          </tr>
          <input type="hidden" name="dailyid" value="<%=db.getDailyid()%>"/>
          <tr>
            <td height="200" align="center" valign="top"><textarea name="comment" cols="45" rows="10" style="margin-top:20px;"></textarea></td>
          </tr>
          <tr>
            <td height="40" class="f12_000"><table width="67" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="67" height="18" align="center"  class="f12_000">
                <input type="submit" name="submit"  value="提交"/></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="260" valign="top" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="300" align="left" valign="top" style="background:url(images/left1_bg.png) top no-repeat;">
            
            <table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:40px;">
              <tr></tr>
              <tr>
                <td height="80" align="center" background="images/pics_bg.png" style="background-repeat:no-repeat; background-position:center;"><img src="img/02.jpg" width="48" height="48" /></td>
              </tr>
              <tr>
                <td height="25" align="center" class="f12_000" style="border-bottom:1px #FFFFBE dotted;"><strong><br /></strong></td>
              </tr>
              <tr>
                <td height="30" class="f12_000" style="padding-left:10px;">昵称：<%=ub.getNickname()%></td>
              </tr>
              <tr>
                <td height="30" class="f12_000" style="padding-left:10px;"><br /></td>
              </tr>
              <tr>
                <td height="30" class="f12_000" style="padding-left:10px;"><a href="bloglistdo">返回博客系统主页</a><br /></td>
              </tr>
              <tr>
                <td height="30" class="f12_000" style="padding-left:10px;"><br /></td>
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
<table width="809" border="0" align="center" cellpadding="0" cellspacing="0" style="background:url(images/foot_bg.png) no-repeat 8px 0;">
  <tr>
    <td height="92" valign="top">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:4px;">
      <tr>
        <td height="25" align="center" valign="middle" class="f12_000">陈巍瑜 版权所有<br /></td>
      </tr>
    </table>
    
    </td>
  </tr>
</table>
</body>
</html>
