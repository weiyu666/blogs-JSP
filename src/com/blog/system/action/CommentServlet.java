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
import com.blog.system.Dao.UserDao;
import com.blog.system.Dto.CommentBean;
import com.blog.system.Dto.UserBean;

public class CommentServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String param = request.getParameter("param");
		if (param == null) {
			param = "view";
		}
		if (param == "view" || param.equals("view")) {
			getComment(request, response);
		} else if (param == "del" || param.equals("del")) {
			try {
				String commentid = request.getParameter("commentid");
				CommentDao cd = new CommentDao();
				cd.delComment(commentid);
			} catch (Exception e) {
				e.printStackTrace();
			}
			getComment(request, response);
		} else if (param == "singlecomment" || param.equals("singlecomment")) {
			String commentid = request.getParameter("commentid");
			CommentDao cd = new CommentDao();
			CommentBean cb = cd.getSingleComment(commentid);
			request.setAttribute("singlecomment", cb);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/system/singlecomment.jsp");
			requestDispatcher.forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void getComment(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		int page;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}
		int size = 10;
		List<CommentBean> ret = new ArrayList<CommentBean>();
		CommentDao cd = new CommentDao();
		try {
			ret = cd.getComment(page, size);
			long count = cd.getCommentCount();
			request.setAttribute("comment", ret);
			request.setAttribute("count", count);
			request.setAttribute("page", page);
			request.setAttribute("size", size);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/system/systemcomment.jsp");
			requestDispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
