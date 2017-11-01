package com.blog.system.action;

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
import com.blog.system.Dao.PhotoDao;
import com.blog.system.Dto.CommentBean;
import com.blog.system.Dto.PhotoBean;

public class Photo_Cservlet extends HttpServlet {

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
			String photoid = request.getParameter("photoid");
			List<CommentBean> ret = new ArrayList<CommentBean>();
			CommentDao cd = new CommentDao();
			ret = cd.getTypeComment(photoid, 0, page, size);
			long count = cd.getTypeCommentCount(photoid, 0);
			PhotoDao pd = new PhotoDao();
			PhotoBean pb = pd.getSinglePhoto(photoid);
			request.setAttribute("comment", ret);
			request.setAttribute("count", count);
			request.setAttribute("page", page);
			request.setAttribute("size", size);
			request.setAttribute("singlephoto", pb);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/system/singlephoto.jsp");
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
