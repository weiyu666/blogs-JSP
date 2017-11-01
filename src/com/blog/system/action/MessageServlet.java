package com.blog.system.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.system.Dao.*;
import com.blog.system.Dto.*;

public class MessageServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String param = request.getParameter("param");
		if (param == null) {
			param = "view";
		}
		if (param == "view" || param.equals("view")) {
			getMessage(request, response);
		} else if (param == "del" || param.equals("del")) {
			try {
				String messageid = request.getParameter("messageid");
				MessageDao md = new MessageDao();
				md.delMessage(messageid);
			} catch (Exception e) {
				e.printStackTrace();
			}
			getMessage(request, response);
		} else if (param == "singlemessage" || param.equals("singlemessage")) {
			String messageid = request.getParameter("messageid");
			MessageDao md = new MessageDao();
			MessageBean mb = md.getSingleMessage(messageid);
			request.setAttribute("singlemessage", mb);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/system/singlecomment.jsp");
			requestDispatcher.forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void getMessage(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		int page;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}
		int size = 10;
		List<MessageBean> ret = new ArrayList<MessageBean>();
		MessageDao md = new MessageDao();
		try {
			ret = md.getSystemMessage(page, size);
			long count = md.getSystemMessageCount();
			request.setAttribute("message", ret);
			request.setAttribute("count", count);
			request.setAttribute("page", page);
			request.setAttribute("size", size);
			RequestDispatcher requestDispatcher = request
					.getRequestDispatcher("/system/systemmessage.jsp");
			requestDispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
