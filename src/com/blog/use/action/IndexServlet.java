package com.blog.use.action;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.system.Dao.DailyDao;
import com.blog.system.Dao.UserDao;
import com.blog.system.Dto.*;

public class IndexServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String userid = request.getParameter("userid");
		UserDao ud = new UserDao();
		UserBean ub = ud.getSingleUser(userid);
		request.setAttribute("userinfo", ub);
		DailyDao dd = new DailyDao();
		DailyBean db = dd.getIndexDaily(userid);
		request.setAttribute("indexdaily", db);
		request.setAttribute("userid", userid);
		RequestDispatcher requestDispatcher = request
				.getRequestDispatcher("/use/index.jsp");
		requestDispatcher.forward(request, response);

	}
}
