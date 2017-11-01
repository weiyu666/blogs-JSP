package com.blog.use.action;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Enumeration;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.system.Dao.DailyDao;
import com.blog.system.Dao.PhotoDao;
import com.blog.system.Dto.DailyBean;
import com.blog.system.Dto.PhotoBean;
import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class UploadServlet extends HttpServlet {
	private ServletConfig config;

	final public void init(ServletConfig config) throws ServletException {
		this.config = config;
	}

	final public ServletConfig getServletConfig() {
		return config;
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("gb2312");
		try {
			SmartUpload su = new SmartUpload();
			su.initialize(config, request, response);
			su.setMaxFileSize(5 * 1024 * 1024);
			su.save("/image/");
			su.upload();
			File file = su.getFiles().getFile(0);
			String picName = (file.getFileName());
			file.saveAs("/image/" + picName, su.SAVE_VIRTUAL);
			String photoname = su.getRequest().getParameter("photoname");
			String photodepict = su.getRequest().getParameter("photodepict");
			String userid = su.getRequest().getParameter("userid");
			int userid1 = Integer.parseInt(userid);
			String serverPath = request.getSession().getServletContext()
					.getRealPath("");
			String photoaddress = request.getContextPath()+"/image/" + picName;
			PhotoBean pb = new PhotoBean();
			int albumid = (Integer)request.getSession().getAttribute("albumid");
			pb.setUserid(userid1);
			pb.setPhotoname(photoname);
			pb.setPhotodepict(photodepict);
			pb.setPhotoaddress(photoaddress);
			pb.setAlbumid(albumid);
			PhotoDao pd = new PhotoDao();
			pd.addPhoto(pb);
			response.sendRedirect(request.getContextPath()
					+ "/use/photoalbumlistdo?userid=" + userid);
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
	}

}
