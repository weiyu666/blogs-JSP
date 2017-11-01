package com.blog.system.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.system.Dao.CommentDao;
import com.blog.system.Dao.DailyDao;
import com.blog.system.Dto.CommentBean;
import com.blog.system.Dto.DailyBean;

public class Daily_CServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int page;
		try {
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			} else {
				page = 1;
			}
			int size = 4;
			String dailyid = request.getParameter("dailyid");
			List<CommentBean> ret = new ArrayList<CommentBean>();
			CommentDao cd = new CommentDao();
			ret = cd.getTypeComment(dailyid, 1, page, size);
			long count = cd.getTypeCommentCount(dailyid, 1);
			DailyDao dd = new DailyDao();
			DailyBean db = dd.getSingleDaily(dailyid);
			request.setAttribute("comment", ret);
			request.setAttribute("count", count);
			request.setAttribute("page", page);
			request.setAttribute("size", size);
			request.setAttribute("singledaily", db);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/system/singledaily.jsp");
			requestDispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
