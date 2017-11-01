package com.blog.system.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import com.blog.system.Dao.CommentDao;
import com.blog.system.Dao.DailyDao;
import com.blog.system.Dao.UserDao;
import com.blog.system.Dto.CommentBean;
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
		if (param == "add" || param.equals("add")) {
			String dailyname = request.getParameter("dailyname");
			String daily = request.getParameter("content");
			DailyBean db = new DailyBean();
			int userid1 = 1;
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
		} else if (param == "view" || param.equals("view")) {
			getDaily(request, response);
		} else if (param == "del" || param.equals("del")) {
			try {
				String dailyid = request.getParameter("dailyid");
				DailyDao dd = new DailyDao();
				dd.delDaily(dailyid);
			} catch (Exception e) {
				e.printStackTrace();
			}
			getDaily(request, response);
		} else if (param == "singledaily" || param.equals("singledaily")) {
			String dailyid = request.getParameter("dailyid");
			DailyDao dd = new DailyDao();
			DailyBean db = dd.getSingleDaily(dailyid);
			request.setAttribute("singledaily", db);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/system/singledaily.jsp");
			requestDispatcher.forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void getDaily(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		int page;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}
		int size = 10;
		List<DailyBean> ret = new ArrayList<DailyBean>();
		DailyDao dd = new DailyDao();
		try {
			ret = dd.getSystemDaily(page, size);
			long count = dd.getDailyCount();
			request.setAttribute("daily", ret);
			request.setAttribute("count", count);
			request.setAttribute("page", page);
			request.setAttribute("size", size);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/system/systemdaily.jsp");
			requestDispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
