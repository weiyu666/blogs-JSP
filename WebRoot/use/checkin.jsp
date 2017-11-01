<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>


<%
	// 接收请求的内容  
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	Connection con = null;
	String CLASSFORNAME = "com.mysql.jdbc.Driver";
	String SERVANDDB = "jdbc:mysql://localhost:3306/blog";
	String USER = "root";
	String PWD = "123456";
	String url = SERVANDDB + "?user=" + USER + "&password=" + PWD;
	Class.forName(CLASSFORNAME).newInstance();
	con = DriverManager.getConnection(url);
	Statement stmt = con.createStatement();
	ResultSet rs = stmt
			.executeQuery("select * from userinfo where username='"
					+ username + "' and password = '" + password+"'");
	if (rs.next()) {
		int userid = rs.getInt("userid");
		session.setAttribute("viewuserid",userid);
		System.out.println(userid);
		response.sendRedirect("bloglistdo");
	} else {
		response.sendRedirect("login_fail.jsp");
	}

	rs.close();
	stmt.close();
	con.close();
%>
