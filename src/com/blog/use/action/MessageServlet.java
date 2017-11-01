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
import com.blog.system.Dao.MessageDao;
import com.blog.system.Dao.UserDao;
import com.blog.system.Dto.CommentBean;
import com.blog.system.Dto.DailyBean;
import com.blog.system.Dto.MessageBean;
import com.blog.system.Dto.UserBean;

public class MessageServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String param = request.getParameter("param");
		if (param == null) {
			param = "view";
		}
		if (param == "view" || param.equals("view")) {
			getMessage(request, response);
		} else if (param == "add" || param.equals("add")) {
			String message = request.getParameter("message");
			int blogid = Integer.parseInt(request.getParameter("blogid"));
			int userid = Integer.parseInt(request.getParameter("userid"));
			MessageBean mb = new MessageBean();
			mb.setBlogid(blogid);
			mb.setUserid(userid);
			mb.setMessage(message);
			MessageDao md = new MessageDao();
			try {
				md.addMessage(mb);
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("/index.html");
			}
			response.sendRedirect(request.getContextPath()
					+ "/use/messagedo?blogid=" + blogid);
		}else if (param == "del" || param.equals("del")) {
			try {
				String blogid = request.getParameter("blogid");
				String messageid = request.getParameter("messageid");
				MessageDao md = new MessageDao();
				md.delMessage(messageid);
				response.sendRedirect(request.getContextPath()
						+ "/use/messagedo?blogid=" + blogid);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
	}

	public void getMessage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int page;
		try {
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			} else {
				page = 1;
			}
			int size = 10;
			String blogid = request.getParameter("blogid");
			List<MessageBean> ret = new ArrayList<MessageBean>();
			MessageDao md = new MessageDao();
			ret = md.getMessage(page, size, blogid);
			long count = md.getMessageCount(blogid);
			UserDao ud = new UserDao();
			UserBean ub = ud.getSingleUser(blogid);
			request.setAttribute("userinfo", ub);
			request.setAttribute("blogid", blogid);
			request.setAttribute("message", ret);
			request.setAttribute("count", count);
			request.setAttribute("page", page);
			request.setAttribute("size", size);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/use/message.jsp");
			requestDispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
