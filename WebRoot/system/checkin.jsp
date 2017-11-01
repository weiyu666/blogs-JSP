<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>


<%
	// 接收请求的内容  
	String adminname = request.getParameter("adminname");
	String password = request.getParameter("password");

	// 判断用户名及密码(www.deepteach.com)
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
			.executeQuery("select * from admininfo where adminname= '"+ adminname + "' and password = '" + password +"'");
	if (rs.next()) {
		session.setAttribute("adminname", adminname);
		response.sendRedirect("/blog/system/userdo");
	} else {
		System.out.println("失败");
	}

	rs.close();
	stmt.close();
	con.close();
%>
