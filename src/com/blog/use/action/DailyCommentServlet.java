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

import com.blog.system.Dao.CommentDao;
import com.blog.system.Dao.DailyDao;
import com.blog.system.Dao.UserDao;
import com.blog.system.Dto.CommentBean;
import com.blog.system.Dto.DailyBean;
import com.blog.system.Dto.UserBean;

public class DailyCommentServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String param = request.getParameter("param");
		if (param == null) {
			param = "view";
		}
		if (param == "view" || param.equals("view")) {
			getDailyComment(request, response);
		} else if (param == "add" || param.equals("add")) {
			String userid1 = request.getParameter("userid1");
			int userid = Integer.parseInt(userid1);
			String comment = request.getParameter("comment");
			String pdid1 = request.getParameter("dailyid");
			int pdid = Integer.parseInt(pdid1);
			CommentBean cb = new CommentBean();
			cb.setUserid(userid);
			cb.setComment(comment);
			cb.setPdid(pdid);
			CommentDao cd = new CommentDao();
			try {
				cd.addComment(cb, 1);
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("/index.html");
			}
			response.sendRedirect(request.getContextPath()
					+ "/use/dailycdo?dailyid=" + pdid);
		}else if (param == "del" || param.equals("del")) {
			try {
				String pdid = request.getParameter("dailyid");
				String commentid = request.getParameter("commentid");
				CommentDao cd = new CommentDao();
				cd.delComment(commentid);
				response.sendRedirect(request.getContextPath()
						+ "/use/dailycdo?dailyid=" + pdid);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void getDailyComment(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int page;
		try {
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			} else {
				page = 1;
			}
			int size = 2;
			String dailyid = request.getParameter("dailyid");
			List<CommentBean> ret = new ArrayList<CommentBean>();
			CommentDao cd = new CommentDao();
			ret = cd.getTypeComment(dailyid, 1, page, size);
			long count = cd.getTypeCommentCount(dailyid, 1);
			DailyDao dd = new DailyDao();
			DailyBean db = dd.getSingleDaily(dailyid);
			String userid = Integer.toString(db.getUserid());
			UserDao ud = new UserDao();
			UserBean ub = ud.getSingleUser(userid);
			request.setAttribute("userid", userid);
			request.setAttribute("userinfo", ub);
			request.setAttribute("comment", ret);
			request.setAttribute("count", count);
			request.setAttribute("page", page);
			request.setAttribute("size", size);
			request.setAttribute("singledaily", db);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/use/daily_comment.jsp");
			requestDispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
