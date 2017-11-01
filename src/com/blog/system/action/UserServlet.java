package com.blog.system.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;
import com.blog.system.Dao.UserDao;
import com.blog.system.Dto.UserBean;

public class UserServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");

		String param = request.getParameter("param");
		if (param == null) {
			param = "view";
		}
		if (param == "reg" || param.equals("reg")) {

			String username = request.getParameter("username");
			String nickname = request.getParameter("nickname");
			String email = request.getParameter("email");
			String password = request.getParameter("password1");
			String blogname = request.getParameter("blogname");
			String blogsign = request.getParameter("blogsign");
			UserBean ub = new UserBean();
			ub.setUsername(username);
			ub.setNickname(nickname);
			ub.setBlogsign(blogsign);
			ub.setEmail(email);
			ub.setBlogname(blogname);
			ub.setPassword(password);
			UserDao ud = new UserDao();
			try {
				ud.addUser(ub);
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("/index.html");
			}
			response.sendRedirect("/blog/use/login.jsp");
		} else if (param == "del" || param.equals("del")) {
			try {
				String userid = request.getParameter("userid");
				UserDao ud = new UserDao();
				ud.delUser(userid);
			} catch (Exception e) {
				e.printStackTrace();
			}
			getUser(request, response);
		} else if (param == "view" || param.equals("view")) {
			getUser(request, response);
		} else if (param == "singleuser" || param.equals("singleuser")) {
			String userid = request.getParameter("userid");
			UserDao ud = new UserDao();
			UserBean ub = ud.getSingleUser(userid);
			request.setAttribute("singleuser", ub);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/system/singleuser.jsp");
			requestDispatcher.forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		doGet(request, response);
	}

	public void getUser(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
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
				.getRequestDispatcher("/system/systemuser.jsp");
		requestDispatcher.forward(request, response);
	}
}
