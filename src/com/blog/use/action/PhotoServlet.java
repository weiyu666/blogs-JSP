package com.blog.use.action;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.blog.system.Dao.*;
import com.blog.system.Dto.*;

public class PhotoServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String param = request.getParameter("param");
		if (param == null) {
			param = "view";
		}
		if (param == "view" || param.equals("view")) {
			getPhoto(request, response);
		} else if (param == "del" || param.equals("del")) {
			try {
				String photoid = request.getParameter("photoid");
				int albumid1 = (Integer) request.getSession().getAttribute(
						"albumid");
				String albumid = Integer.toString(albumid1);
				PhotoDao pd = new PhotoDao();
				pd.delPhoto(photoid);

				request.setCharacterEncoding("utf-8");
				int page;
				if (request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page"));
				} else {
					page = 1;
				}
				int size = 10;
				String userid = request.getParameter("userid");
				List<PhotoBean> ret = new ArrayList<PhotoBean>();
				ret = pd.getPhoto(page, size, userid, albumid);
				long count = pd.getPhotoCount();
				UserDao ud = new UserDao();
				UserBean ub = ud.getSingleUser(userid);
				PhotoalbumDao pad = new PhotoalbumDao();
				String albumname = pad.getAlbumname(albumid);
				// System.out.println(albumname);
				request.setAttribute("userinfo", ub);
				request.setAttribute("userid", userid);
				request.setAttribute("count", count);
				request.setAttribute("page", page);
				request.setAttribute("size", size);
				request.setAttribute("photo", ret);
				request.setAttribute("albumname", albumname);
				request.setAttribute("albumid", albumid1);
				RequestDispatcher requestDispatcher = request
						.getRequestDispatcher("/use/photo_list.jsp");
				requestDispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (param == "singlephoto" || param.equals("singlephoto")) {
			String photoid = request.getParameter("photoid");
			PhotoDao pd = new PhotoDao();
			PhotoBean pb = pd.getSinglePhoto(photoid);
			request.setAttribute("singlephoto", pb);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/system/singlephoto.jsp");
			requestDispatcher.forward(request, response);
		} else if (param == "preupload" || param.equals("preupload")) {
			String userid = request.getParameter("userid");
			UserDao ud = new UserDao();
			UserBean ub = ud.getSingleUser(userid);
			request.setAttribute("userinfo", ub);
			request.setAttribute("userid", userid);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/use/upload.jsp");
			requestDispatcher.forward(request, response);
		} else if (param == "preupdate" || param.equals("preupdate")) {
			String userid = request.getParameter("userid");
			String photoid = request.getParameter("photoid");
			UserDao ud = new UserDao();
			UserBean ub = ud.getSingleUser(userid);
			PhotoDao pd = new PhotoDao();
			PhotoBean pb = pd.getSinglePhoto(photoid);
			request.setAttribute("userinfo", ub);
			request.setAttribute("userid", userid);
			request.setAttribute("singlephoto", pb);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/use/updatephoto.jsp");
			requestDispatcher.forward(request, response);
		} else if (param == "update" || param.equals("update")) {
			String photoname = request.getParameter("photoname");
			String photodepict = request.getParameter("photodepict");
			String userid = request.getParameter("userid");
			String photoid = request.getParameter("photoid");
			String albumid = request.getParameter("albumid");
			int userid1 = Integer.parseInt(userid);
			int photoid1 = Integer.parseInt(photoid);
			PhotoBean pb = new PhotoBean();
			pb.setUserid(userid1);
			pb.setPhotoname(photoname);
			pb.setPhotodepict(photodepict);
			pb.setPhotoid(photoid1);
			PhotoDao pd = new PhotoDao();
			try {
				pd.updatePhoto(pb);
				response.sendRedirect(request.getContextPath()
						+ "/use/photodo?albumid=" + albumid + "&userid="
						+ userid);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void getPhoto(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		int page;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}
		int size = 10;
		String userid = request.getParameter("userid");
		String albumid = request.getParameter("albumid");
		int albumid1 = Integer.parseInt(albumid);
		try {
			List<PhotoBean> ret = new ArrayList<PhotoBean>();
			PhotoDao pd = new PhotoDao();
			ret = pd.getPhoto(page, size, userid, albumid);
			long count = pd.getPhotoCount();
			UserDao ud = new UserDao();
			UserBean ub = ud.getSingleUser(userid);
			PhotoalbumDao pad = new PhotoalbumDao();
			String albumname = pad.getAlbumname(albumid);
			// System.out.println(albumname);
			request.setAttribute("userinfo", ub);
			request.setAttribute("userid", userid);
			request.setAttribute("count", count);
			request.setAttribute("page", page);
			request.setAttribute("size", size);
			request.setAttribute("photo", ret);
			request.setAttribute("albumname", albumname);
			request.setAttribute("albumid", albumid1);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/use/photo_list.jsp");
			requestDispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
