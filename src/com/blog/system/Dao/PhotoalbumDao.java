package com.blog.system.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.blog.system.Dto.*;
import com.blog.util.db.GetDbCon;

public class PhotoalbumDao {
	private Connection con;
	PhotoalbumBean pab = new PhotoalbumBean();

	public void setPhotoalbum(PhotoalbumBean pab) {
		this.pab = pab;
	}

	public List<PhotoalbumBean> getPhotoalbum(int page, int size, String userid1)
			throws Exception {
		List<PhotoalbumBean> ret = new ArrayList<PhotoalbumBean>();
		int begin = (page - 1) * size;
		try {
			con = GetDbCon.getDbConn();
			Statement stm = con.createStatement();
			ResultSet result = stm
					.executeQuery("select * from photoalbum where userid='"
							+ userid1 + "' limit " + begin + "," + size);

			while (result.next()) {
				int albumid = result.getInt("albumid");
				int userid = result.getInt("userid");
				String albumname = result.getString("albumname");
				String albumdepict = result.getString("albumdepict");
				java.sql.Date createtime = result.getDate("createtime");

				PhotoalbumBean pab = new PhotoalbumBean();

				pab.setAlbumid(albumid);
				pab.setAlbumname(albumname);
				pab.setAlbumdepict(albumdepict);
				pab.setCreatetime(createtime);
				pab.setUserid(userid);

				ret.add(pab);
			}
			result.close();
			stm.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

	public Long getPhotoalbumCount(String userid) {
		long l = 0;
		con = GetDbCon.getDbConn();
		try {
			Statement stm = con.createStatement();
			ResultSet result = stm
					.executeQuery("select count(*) from photoalbum where userid = "
							+ userid);
			if (result.next()) {
				l = result.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return l;
	}

	public void delPhotoalbum(String albumid) throws SQLException {
		con = GetDbCon.getDbConn();
		Statement stm = con.createStatement();
		stm.execute("DELETE FROM photoalbum where albumid ='" + albumid + "'");
	}

	public void addPhotoalbum(PhotoalbumBean pab) {
		try {

			con = GetDbCon.getDbConn();
			PreparedStatement stm = con
					.prepareStatement("insert into photoalbum(albumname,albumdepict,createtime,userid) values(?,?,NOW(),?)");
			stm.setString(1, pab.getAlbumname());
			stm.setString(2, pab.getAlbumdepict());
			//stm.setDate(3, new java.sql.Date(new java.util.Date().getTime()));
			stm.setInt(3, pab.getUserid());
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

	public String getAlbumname(String albumid) {
		String albumname = null;
		try {
			con = GetDbCon.getDbConn();
			Statement stm = con.createStatement();
			ResultSet result = stm
					.executeQuery("select * from photoalbum where albumid="
							+ albumid);
			while (result.next()) {
				albumname = result.getString("albumname");
				PhotoalbumBean pab = new PhotoalbumBean();
				pab.setAlbumname(albumname);
			}
			result.close();
			stm.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return albumname;
	}
	public PhotoalbumBean getSingleAlbum(String albumid1) {
		PhotoalbumBean pab = new PhotoalbumBean();

		try {
			con = GetDbCon.getDbConn();
			Statement stm = con.createStatement();
			ResultSet result = stm
					.executeQuery("select * from photoalbum where albumid = "
							+ albumid1);
			while (result.next()) {
				int userid = result.getInt("userid");
				int albumid = result.getInt("albumid");
				String albumname = result.getString("albumname");
				String albumdepict = result.getString("albumdepict");
				pab.setAlbumname(albumname);
				pab.setAlbumid(albumid);
				pab.setAlbumdepict(albumdepict);
				pab.setUserid(userid);
			}
			result.close();
			stm.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pab;
	}
	public void updateAlbum(PhotoalbumBean pab) {
		try {

			con = GetDbCon.getDbConn();
			PreparedStatement stm = con
					.prepareStatement("update photoalbum set albumname=?,albumdepict=? where albumid=?");
			stm.setString(1, pab.getAlbumname());
			stm.setString(2, pab.getAlbumdepict());
			stm.setInt(3,pab.getAlbumid());
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
}
