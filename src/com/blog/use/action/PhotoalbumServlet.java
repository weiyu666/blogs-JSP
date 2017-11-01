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

public class PhotoalbumServlet extends HttpServlet {
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
			int size = 12;
			String userid = request.getParameter("userid");
			List<PhotoalbumBean> ret = new ArrayList<PhotoalbumBean>();

			PhotoalbumDao pad = new PhotoalbumDao();
			try {
				ret = pad.getPhotoalbum(page, size, userid);
				long count = pad.getPhotoalbumCount(userid);
				UserDao ud = new UserDao();
				UserBean ub = ud.getSingleUser(userid);
				request.setAttribute("userinfo", ub);
				request.setAttribute("userid", userid);
				request.setAttribute("photoalbum", ret);
				request.setAttribute("count", count);
				request.setAttribute("page", page);
				request.setAttribute("size", size);
				RequestDispatcher requestDispatcher = request
						.getRequestDispatcher("/use/photo_album_list.jsp");
				requestDispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (param == "add" || param.equals("add")) {
			String albumname = request.getParameter("albumname");
			String albumdepict = request.getParameter("albumdepict");
			//System.out.println(albumname);
			PhotoalbumBean pab = new PhotoalbumBean();
			String userid = request.getParameter("userid");
			int userid1 = Integer.parseInt(userid);
			pab.setUserid(userid1);
			pab.setAlbumname(albumname);
			pab.setAlbumdepict(albumdepict);
			PhotoalbumDao pad = new PhotoalbumDao();
			try {
				pad.addPhotoalbum(pab);
				response.sendRedirect(request.getContextPath()
						+ "/use/photoalbumlistdo?userid=" + userid);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if (param == "preadd" || param.equals("preadd")) {
			String userid = request.getParameter("userid");
			UserDao ud = new UserDao();
			UserBean ub = ud.getSingleUser(userid);
			request.setAttribute("userinfo", ub);
			request.setAttribute("userid", userid);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/use/addphotoalbum.jsp");
			requestDispatcher.forward(request, response);
		}else if (param == "del" || param.equals("del")) {
			try {
				String userid = request.getParameter("userid");
				String albumid = request.getParameter("albumid");
				PhotoalbumDao pad = new PhotoalbumDao();
				pad.delPhotoalbum(albumid);
				response.sendRedirect(request.getContextPath()
						+ "/use/photoalbumlistdo?userid=" + userid);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (param == "preupdate" || param.equals("preupdate")) {
			String userid = request.getParameter("userid");
			String albumid = request.getParameter("albumid");
			UserDao ud = new UserDao();
			UserBean ub = ud.getSingleUser(userid);
			PhotoalbumDao pad = new PhotoalbumDao();
			PhotoalbumBean pab = new PhotoalbumBean();
			pab = pad.getSingleAlbum(albumid);
			request.setAttribute("userinfo", ub);
			request.setAttribute("userid", userid);
			request.setAttribute("singlealbum", pab);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/use/updatealbum.jsp");
			requestDispatcher.forward(request, response);
		}else if (param == "update" || param.equals("update")) {
			String albumname = request.getParameter("albumname");
			String albumdepict = request.getParameter("albumdepict");
			String userid = request.getParameter("userid");
			String albumid = request.getParameter("albumid");
			int userid1 = Integer.parseInt(userid);
			int albumid1 = Integer.parseInt(albumid);
			//System.out.println(albumname);
			PhotoalbumBean pab = new PhotoalbumBean();
			pab.setAlbumid(albumid1);
			pab.setUserid(userid1);
			pab.setAlbumname(albumname);
			pab.setAlbumdepict(albumdepict);
			PhotoalbumDao pad = new PhotoalbumDao();
			try {
				pad.updateAlbum(pab);
				response.sendRedirect(request.getContextPath()
						+ "/use/photoalbumlistdo?userid=" + userid);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
