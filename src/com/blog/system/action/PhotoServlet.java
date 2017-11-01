package com.blog.system.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.system.Dao.DailyDao;
import com.blog.system.Dao.PhotoDao;
import com.blog.system.Dto.DailyBean;
import com.blog.system.Dto.PhotoBean;

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
				PhotoDao pd = new PhotoDao();
				pd.delPhoto(photoid);
			} catch (Exception e) {
				e.printStackTrace();
			}
			getPhoto(request, response);
		} else if (param == "singlephoto" || param.equals("singlephoto")) {
			String photoid = request.getParameter("photoid");
			PhotoDao pd = new PhotoDao();
			PhotoBean pb = pd.getSinglePhoto(photoid);
			request.setAttribute("singlephoto", pb);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/system/singlephoto.jsp");
			requestDispatcher.forward(request, response);
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void getPhoto(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		int page;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}
		int size = 10;

		try {
			List<PhotoBean> ret = new ArrayList<PhotoBean>();
			PhotoDao pd = new PhotoDao();
			ret = pd.getSystemPhoto(page, size);
			long count = pd.getPhotoCount();
			request.setAttribute("count", count);
			request.setAttribute("page", page);
			request.setAttribute("size", size);
			request.setAttribute("photo", ret);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/system/systemphoto.jsp");
			requestDispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
