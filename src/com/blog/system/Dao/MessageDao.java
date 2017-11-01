package com.blog.system.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.blog.system.Dto.CommentBean;
import com.blog.system.Dto.MessageBean;
import com.blog.util.db.GetDbCon;

public class MessageDao {
	private Connection con;
	MessageBean mb = new MessageBean();

	public void setMessage(MessageBean mb) {
		this.mb = mb;
	}

	public void addMessage(MessageBean mb) {
		try {
			con = GetDbCon.getDbConn();
			PreparedStatement stm = con
					.prepareStatement("insert into message(userid,blogid,message,messagetime) values(?,?,?,NOW())");

			stm.setInt(1, mb.getUserid());
			stm.setInt(2, mb.getBlogid());
			stm.setString(3, mb.getMessage());
			stm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public List<MessageBean> getMessage(int page, int size, String blogid1)
			throws Exception {
		List<MessageBean> ret = new ArrayList<MessageBean>();
		int begin = (page - 1) * size;
		con = GetDbCon.getDbConn();
		Statement stm = con.createStatement();
		ResultSet result = stm
				.executeQuery("select * from message left join userinfo  on message.userid=userinfo.userid where blogid = '"
						+ blogid1
						+ "' order by messageid desc limit "
						+ begin
						+ "," + size);

		while (result.next()) {
			int messageid = result.getInt("messageid");
			String message = result.getString("message");
			java.sql.Date messagetime = result.getDate("messagetime");
			String nickname = result.getString("nickname");
			MessageBean mb = new MessageBean();
			mb.setMessageid(messageid);
			mb.setMessage(message);
			mb.setMessagetime(messagetime);
			mb.setNickname(nickname);
			ret.add(mb);
		}
		result.close();
		stm.close();
		con.close();
		return ret;

	}

	public List<MessageBean> getSystemMessage(int page, int size)
			throws Exception {
		List<MessageBean> ret = new ArrayList<MessageBean>();
		int begin = (page - 1) * size;
		con = GetDbCon.getDbConn();
		Statement stm = con.createStatement();
		ResultSet result = stm
				.executeQuery("select * from message order by messageid limit "
						+ begin + "," + size);

		while (result.next()) {
			int messageid = result.getInt("messageid");
			String message = result.getString("message");
			java.sql.Date messagetime = result.getDate("messagetime");
			int blogid = result.getInt("blogid");
			MessageBean mb = new MessageBean();
			mb.setMessageid(messageid);
			mb.setBlogid(blogid);
			mb.setMessage(message);
			mb.setMessagetime(messagetime);
			ret.add(mb);
		}
		result.close();
		stm.close();
		con.close();
		return ret;

	}

	public Long getMessageCount(String blogid) {
		long l = 0;
		con = GetDbCon.getDbConn();
		try {
			Statement stm = con.createStatement();
			ResultSet result = stm
					.executeQuery("select count(*) from message where blogid="
							+ blogid);
			if (result.next()) {
				l = result.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return l;
	}

	public Long getSystemMessageCount() {
		long l = 0;
		con = GetDbCon.getDbConn();
		try {
			Statement stm = con.createStatement();
			ResultSet result = stm.executeQuery("select count(*) from message");
			if (result.next()) {
				l = result.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return l;
	}

	public void delMessage(String messageid) throws SQLException {
		con = GetDbCon.getDbConn();
		Statement stm = con.createStatement();
		stm.execute("DELETE FROM message where messageid ='" + messageid + "'");
	}

	public MessageBean getSingleMessage(String messageid) {
		MessageBean mb = new MessageBean();

		try {
			con = GetDbCon.getDbConn();
			Statement stm = con.createStatement();
			int messageid1 = Integer.parseInt(messageid);
			ResultSet result = stm
					.executeQuery("select * from message where messageid = "
							+ messageid1);
			while (result.next()) {
				String message = result.getString("message");
				java.sql.Date messagetime = result.getDate("messagetime");
				int blogid = result.getInt("blogid");
				int userid = result.getInt("userid");
				mb.setMessageid(messageid1);
				mb.setMessage(message);
				mb.setMessagetime(messagetime);
				mb.setUserid(userid);
				mb.setBlogid(blogid);
			}
			result.close();
			stm.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mb;
	}
}
