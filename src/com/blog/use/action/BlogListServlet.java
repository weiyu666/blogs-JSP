package com.blog.use.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.system.Dao.DailyDao;
import com.blog.system.Dao.UserDao;
import com.blog.system.Dto.DailyBean;
import com.blog.system.Dto.UserBean;

public class BlogListServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int page;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}
		int size = 10;

		List<UserBean> ret = new ArrayList<UserBean>();
		UserDao ud = new UserDao();
		ret = ud.getUser(page, size);
		long count = ud.getUserCount();
		request.setAttribute("user", ret);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("size", size);
		RequestDispatcher requestDispatcher = request
				.getRequestDispatcher("/use/blog_list.jsp");
		requestDispatcher.forward(request, response);
	}

}
