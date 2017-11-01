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

public class DailyServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String param = request.getParameter("param");
		if (param == null) {
			param = "view";
		}
		if (param == "view" || param.equalsIgnoreCase("view")) {
			int page;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			} else {
				page = 1;
			}
			int size = 20;
			String userid = request.getParameter("userid");
			List<DailyBean> ret = new ArrayList<DailyBean>();
			DailyDao dd = new DailyDao();
			try {

				ret = dd.getDaily(page, size, userid);
				long count = dd.getUseDailyCount(userid);
				UserDao ud = new UserDao();
				UserBean ub = ud.getSingleUser(userid);
				request.setAttribute("userinfo", ub);
				request.setAttribute("userid", userid);
				request.setAttribute("daily", ret);
				request.setAttribute("count", count);
				request.setAttribute("page", page);
				request.setAttribute("size", size);
				RequestDispatcher requestDispatcher = request
						.getRequestDispatcher("/use/daily_list.jsp");
				requestDispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (param == "del" || param.equals("del")) {
			try {
				String userid = request.getParameter("userid");
				String dailyid = request.getParameter("dailyid");
				DailyDao dd = new DailyDao();
				dd.delDaily(dailyid);
				response.sendRedirect(request.getContextPath()
						+ "/use/dailydo?userid=" + userid);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (param == "update" || param.equals("update")) {
			String dailyid1 = request.getParameter("dailyid");
			int dailyid = Integer.parseInt(dailyid1);
			String dailyname = request.getParameter("dailyname");
			String daily = request.getParameter("content");
			java.sql.Date modifytime = new java.sql.Date(new java.util.Date()
					.getTime());
			DailyBean db = new DailyBean();
			db.setDailyid(dailyid);
			db.setDailyname(dailyname);
			db.setDaily(daily);
			db.setModifytime(modifytime);
			DailyDao dd = new DailyDao();
			try {
				dd.updateDaily(db);
				response.sendRedirect(request.getContextPath()
						+ "/use/dailycdo?dailyid=" + dailyid);
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("/index.html");
			}
		} else if (param == "preupdate" || param.equals("preupdate")) {
			String dailyid = request.getParameter("dailyid");
			DailyDao dd = new DailyDao();
			try {
				UserDao ud = new UserDao();
				String userid = request.getParameter("userid");
				UserBean ub = ud.getSingleUser(userid);
				DailyBean db = dd.getSingleDaily(dailyid);
				request.setAttribute("userinfo", ub);
				request.setAttribute("userid", userid);
				request.setAttribute("singledaily", db);
				RequestDispatcher requestDispatcher = request
						.getRequestDispatcher("/use/updatedaily.jsp");
				requestDispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("/index.html");
			}
		} else if (param == "add" || param.equals("add")) {
			String dailyname = request.getParameter("dailyname");
			String daily = request.getParameter("content");
			DailyBean db = new DailyBean();
			String userid = request.getParameter("userid");
			int userid1 = Integer.parseInt(userid);
			db.setUserid(userid1);
			db.setDailyname(dailyname);
			db.setDaily(daily);
			DailyDao dd = new DailyDao();
			try {
				dd.addDaily(db);
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("/index.html");
			}
			response.sendRedirect(request.getContextPath()
					+ "/use/dailydo?userid=" + userid1);
		} else if (param == "preadd" || param.equals("preadd")) {
			String userid = request.getParameter("userid");
			UserDao ud = new UserDao();
			UserBean ub = ud.getSingleUser(userid);
			request.setAttribute("userinfo", ub);
			request.setAttribute("userid", userid);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/use/writedaily.jsp");
			requestDispatcher.forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
