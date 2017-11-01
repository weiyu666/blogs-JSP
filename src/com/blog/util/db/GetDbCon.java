package com.blog.util.db;

import java.sql.*;


public class GetDbCon {
	
	public static Connection getDbConn(){
		Connection con = null;
		String CLASSFORNAME = "com.mysql.jdbc.Driver";
		String SERVANDDB = "jdbc:mysql://localhost:3306/blog";
		String USER = "root";
		String PWD = "123456";
		String url=SERVANDDB+"?user="+USER+"&password="+PWD+"&useUnicode=true&characterEncoding=UTF-8";
		try {
			Class.forName(CLASSFORNAME).newInstance();
			con = DriverManager.getConnection(url);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}


