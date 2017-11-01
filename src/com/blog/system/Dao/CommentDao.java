package com.blog.system.Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.blog.util.db.*;
import com.blog.system.Dto.CommentBean;
import com.blog.system.Dto.DailyBean;
import com.blog.system.Dto.UserBean;

public class CommentDao {
	private Connection con;
	CommentBean cb = new CommentBean();

	public void setComment(CommentBean cb) {
		this.cb = cb;
	}

	public List<CommentBean> getComment(int page, int size) throws Exception {
		List<CommentBean> ret = new ArrayList<CommentBean>();
		int begin = (page - 1) * size;
		con = GetDbCon.getDbConn();
		Statement stm = con.createStatement();
		ResultSet result = stm
				.executeQuery("select * from comment order by commentid limit "
						+ begin + "," + size);

		while (result.next()) {
			int commentid = result.getInt("commentid");
			String comment = result.getString("comment");
			java.sql.Date commenttime = result.getDate("commenttime");
			int flag = result.getInt("flag");
			CommentBean cb = new CommentBean();
			cb.setComment(comment);
			cb.setCommenttime(commenttime);
			cb.setCommentid(commentid);
			cb.setFlag(flag);
			ret.add(cb);
		}
		result.close();
		stm.close();
		con.close();
		return ret;

	}

	public Long getCommentCount() {
		long l = 0;
		con = GetDbCon.getDbConn();
		try {
			Statement stm = con.createStatement();
			ResultSet result = stm.executeQuery("select count(*) from comment");
			if (result.next()) {
				l = result.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return l;
	}

	public void delComment(String commentid) throws SQLException {
		con = GetDbCon.getDbConn();
		Statement stm = con.createStatement();
		stm.execute("DELETE FROM comment where commentid ='" + commentid + "'");
	}

	public List<CommentBean> getTypeComment(String id, int type, int page,
			int size) throws Exception {
		List<CommentBean> ret = new ArrayList<CommentBean>();
		int begin = (page - 1) * size;
		int id1 = Integer.parseInt(id);
		con = GetDbCon.getDbConn();
		Statement stm = con.createStatement();
		ResultSet result = stm
				.executeQuery("select * from userinfo right join comment on userinfo.userid=comment.userid where pdid="
						+ id1
						+ " and flag="
						+ type
						+ " order by commentid desc limit "
						+ begin
						+ ","
						+ size);
		while (result.next()) {
			int userid = result.getInt("userid");
			int commentid = result.getInt("commentid");
			String nickname = result.getString("nickname");
			String comment = result.getString("comment");
			java.sql.Date commenttime = result.getDate("commenttime");
			CommentBean cb = new CommentBean();
			cb.setUserid(userid);
			cb.setComment(comment);
			cb.setCommenttime(commenttime);
			cb.setCommentid(commentid);
			cb.setCommentname(nickname);
			
			ret.add(cb);
		}
		result.close();
		stm.close();
		con.close();
		return ret;
	}

	public Long getTypeCommentCount(String id, int type) {
		long l = 0;
		con = GetDbCon.getDbConn();
		int id1 = Integer.parseInt(id);
		try {
			Statement stm = con.createStatement();
			ResultSet result = stm
					.executeQuery("select count(*) from comment where pdid="
							+ id1 + " and flag=" + type);
			if (result.next()) {
				l = result.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return l;
	}

	public void addComment(CommentBean cb, int type) {
		try {
			con = GetDbCon.getDbConn();
			PreparedStatement stm = con
					.prepareStatement("insert into comment(userid,pdid,comment,commenttime,flag) values(?,?,?,NOW(),?)");
			stm.setInt(1, cb.getUserid());
			stm.setInt(2, cb.getPdid());
			stm.setString(3, cb.getComment());
			stm.setInt(4, type);
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

	public CommentBean getSingleComment(String commentid) {
		CommentBean cb = new CommentBean();

		try {
			con = GetDbCon.getDbConn();
			Statement stm = con.createStatement();
			int commentid1 = Integer.parseInt(commentid);
			ResultSet result = stm
					.executeQuery("select * from comment where commentid = "
							+ commentid1);
			while (result.next()) {
				String comment = result.getString("comment");
				int flag = result.getInt("flag");
				java.sql.Date commenttime = result.getDate("commenttime");
				cb.setCommentid(commentid1);
				cb.setComment(comment);
				cb.setCommenttime(commenttime);
				cb.setFlag(flag);
			}
			result.close();
			stm.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cb;
	}
}
