package com.blog.system.Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.blog.util.db.*;
import com.blog.system.Dto.DailyBean;
import com.blog.system.Dto.UserBean;

public class DailyDao {
	private Connection con;
	DailyBean db = new DailyBean();

	public void setDaily(DailyBean db) {
		this.db = db;
	}

	public DailyBean getIndexDaily(String userid1) {
		try {
			con = GetDbCon.getDbConn();
			Statement stm = con.createStatement();
			int userid = Integer.parseInt(userid1);
			ResultSet result = stm
					.executeQuery("select * from daily where userid = "
							+ userid + " order by dailyid desc limit 1 ");
			while (result.next()) {
				int dailyid = result.getInt("dailyid");
				String dailyname = result.getString("dailyname");
				String daily = result.getString("daily");
				java.sql.Date postingdate = result.getDate("postingdate");
				java.sql.Date modifytime = result.getDate("modifytime");
				db.setUserid(userid);
				db.setDailyid(dailyid);
				db.setDailyname(dailyname);
				db.setDaily(daily);
				db.setPostingdate(postingdate);
				db.setModifytime(modifytime);
			}
			result.close();
			stm.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return db;
	}

	public List<DailyBean> getDaily(int page, int size, String userid1)
			throws Exception {
		List<DailyBean> ret = new ArrayList<DailyBean>();
		int begin = (page - 1) * size;
		con = GetDbCon.getDbConn();
		Statement stm = con.createStatement();
		ResultSet result = stm.executeQuery("select * from daily where userid="
				+ userid1 + " order by dailyid limit " + begin + "," + size);

		while (result.next()) {
			int userid = result.getInt("userid");
			int dailyid = result.getInt("dailyid");
			String dailyname = result.getString("dailyname");
			java.sql.Date postingdate = result.getDate("postingdate");
			java.sql.Date modifytime = result.getDate("modifytime");

			DailyBean db = new DailyBean();
			db.setUserid(userid);
			db.setDailyid(dailyid);
			db.setDailyname(dailyname);
			db.setPostingdate(postingdate);
			db.setModifytime(modifytime);
			ret.add(db);
		}
		result.close();
		stm.close();
		con.close();
		return ret;
	}

	public List<DailyBean> getSystemDaily(int page, int size) throws Exception {
		List<DailyBean> ret = new ArrayList<DailyBean>();
		int begin = (page - 1) * size;
		con = GetDbCon.getDbConn();
		Statement stm = con.createStatement();
		ResultSet result = stm
				.executeQuery("select * from daily order by dailyid desc limit "
						+ begin + "," + size);
		while (result.next()) {
			int userid = result.getInt("userid");
			int dailyid = result.getInt("dailyid");
			String dailyname = result.getString("dailyname");
			java.sql.Date postingdate = result.getDate("postingdate");
			java.sql.Date modifytime = result.getDate("modifytime");

			DailyBean db = new DailyBean();
			db.setUserid(userid);
			db.setDailyid(dailyid);
			db.setDailyname(dailyname);
			db.setPostingdate(postingdate);
			db.setModifytime(modifytime);
			ret.add(db);
		}
		result.close();
		stm.close();
		con.close();
		return ret;
	}

	public Long getDailyCount() {
		long l = 0;
		con = GetDbCon.getDbConn();
		try {
			Statement stm = con.createStatement();
			ResultSet result = stm.executeQuery("select count(*) from daily");
			if (result.next()) {
				l = result.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return l;
	}

	public Long getUseDailyCount(String userid) {
		long l = 0;
		con = GetDbCon.getDbConn();
		try {
			Statement stm = con.createStatement();
			ResultSet result = stm
					.executeQuery("select count(*) from daily where userid ="
							+ userid);
			if (result.next()) {
				l = result.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return l;
	}

	public void addDaily(DailyBean db) {
		try {

			con = GetDbCon.getDbConn();
			PreparedStatement stm = con
					.prepareStatement("insert into daily(dailyname,daily,postingdate,userid) values(?,?,?,?)");
			stm.setString(1, db.getDailyname());
			stm.setString(2, db.getDaily());
			stm.setDate(3, new java.sql.Date(new java.util.Date().getTime()));
			stm.setInt(4, db.getUserid());
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

	public void updateDaily(DailyBean db) {
		try {

			con = GetDbCon.getDbConn();
			PreparedStatement stm = con
					.prepareStatement("update daily set dailyname=?,daily=?,modifytime=? where dailyid=?");
			stm.setString(1, db.getDailyname());
			stm.setString(2, db.getDaily());
			stm.setDate(3, new java.sql.Date(new java.util.Date().getTime()));
			stm.setInt(4, db.getDailyid());
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

	public void delDaily(String dailyid) throws SQLException {
		con = GetDbCon.getDbConn();
		Statement stm = con.createStatement();
		stm.execute("DELETE FROM daily where dailyid ='" + dailyid + "'");
	}

	public DailyBean getSingleDaily(String dailyid) {
		DailyBean db = new DailyBean();

		try {
			con = GetDbCon.getDbConn();
			Statement stm = con.createStatement();
			int dailyid1 = Integer.parseInt(dailyid);
			ResultSet result = stm
					.executeQuery("select * from daily where dailyid = "
							+ dailyid1);
			while (result.next()) {
				int userid = result.getInt("userid");
				String dailyname = result.getString("dailyname");
				String daily = result.getString("daily");
				java.sql.Date postingdate = result.getDate("postingdate");
				java.sql.Date modifytime = result.getDate("modifytime");
				db.setUserid(userid);
				db.setDailyid(dailyid1);
				db.setDailyname(dailyname);
				db.setDaily(daily);
				db.setPostingdate(postingdate);
				db.setModifytime(modifytime);
			}
			result.close();
			stm.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return db;
	}
}