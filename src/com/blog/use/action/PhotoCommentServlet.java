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

import com.blog.system.Dao.*;
import com.blog.system.Dto.*;

public class PhotoCommentServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String param = request.getParameter("param");

		if (param == null) {
			param = "view";
		}
		if (param == "view" || param.equals("view")) {
			getPhotoComment(request, response);
		} else if (param == "add" || param.equals("add")) {
			String userid = request.getParameter("userid");
			int userid1 = Integer.parseInt(userid);
			String comment = request.getParameter("comment");
			String pdid1 = request.getParameter("photoid");
			int pdid = Integer.parseInt(pdid1);
			CommentBean cb = new CommentBean();
			cb.setUserid(userid1);
			cb.setComment(comment);
			cb.setPdid(pdid);
			CommentDao cd = new CommentDao();
			try {
				cd.addComment(cb, 0);
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("/index.html");
			}
			response.sendRedirect(request.getContextPath()
					+ "/use/photocdo?photoid=" + pdid);
		}else if (param == "del" || param.equals("del")) {
			try {
				String pdid = request.getParameter("photoid");
				String commentid = request.getParameter("commentid");
				CommentDao cd = new CommentDao();
				cd.delComment(commentid);
				response.sendRedirect(request.getContextPath()
						+ "/use/photocdo?photoid=" + pdid);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void getPhotoComment(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int page;
		try {
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			} else {
				page = 1;
			}
			int size = 2;
			String photoid = request.getParameter("photoid");
			List<CommentBean> ret = new ArrayList<CommentBean>();
			CommentDao cd = new CommentDao();
			ret = cd.getTypeComment(photoid, 0, page, size);
			long count = cd.getTypeCommentCount(photoid, 0);
			PhotoDao pd = new PhotoDao();
			PhotoBean pb = pd.getSinglePhoto(photoid);
			String userid = Integer.toString(pb.getUserid());
			UserDao ud = new UserDao();
			UserBean ub = ud.getSingleUser(userid);
			request.setAttribute("userinfo", ub);
			request.setAttribute("comment", ret);
			request.setAttribute("count", count);
			request.setAttribute("page", page);
			request.setAttribute("size", size);
			request.setAttribute("singlephoto", pb);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/use/photo_comment.jsp");
			requestDispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
