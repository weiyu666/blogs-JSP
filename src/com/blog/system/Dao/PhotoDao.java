package com.blog.system.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.blog.system.Dto.DailyBean;
import com.blog.system.Dto.PhotoBean;
import com.blog.system.Dto.PhotoalbumBean;
import com.blog.util.db.GetDbCon;

public class PhotoDao {
	private Connection con;
	PhotoBean pb = new PhotoBean();

	public void setPhoto(PhotoBean pb) {
		this.pb = pb;
	}

	public List<PhotoBean> getPhoto(int page, int size, String userid1,
			String albumid) throws Exception {
		List<PhotoBean> ret = new ArrayList<PhotoBean>();
		int begin = (page - 1) * size;
		try {
			con = GetDbCon.getDbConn();
			Statement stm = con.createStatement();
			ResultSet result = stm
					.executeQuery("select * from photoinfo where userid='"
							+ userid1 + "' and albumid='" + albumid + "'limit "
							+ begin + "," + size);

			while (result.next()) {
				int photoid = result.getInt("photoid");
				int userid = result.getInt("userid");
				int albumid1 = result.getInt("albumid");
				String photoname = result.getString("photoname");
				String photodepict = result.getString("photodepict");
				String photoaddress = result.getString("photoaddress");
				java.sql.Date uploadtime = result.getDate("uploadtime");

				PhotoBean pb = new PhotoBean();
				pb.setAlbumid(albumid1);
				pb.setPhotoid(photoid);
				pb.setUserid(userid);
				pb.setPhotoname(photoname);
				pb.setPhotoaddress(photoaddress);
				pb.setPhotodepict(photodepict);
				pb.setUploadtime(uploadtime);

				ret.add(pb);
			}
			result.close();
			stm.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

	public List<PhotoBean> getSystemPhoto(int page, int size) throws Exception {
		List<PhotoBean> ret = new ArrayList<PhotoBean>();
		int begin = (page - 1) * size;
		try {
			con = GetDbCon.getDbConn();
			Statement stm = con.createStatement();
			ResultSet result = stm
					.executeQuery("select * from photoinfo limit " + begin
							+ "," + size);

			while (result.next()) {
				int photoid = result.getInt("photoid");
				int userid = result.getInt("userid");
				String photoname = result.getString("photoname");
				String photodepict = result.getString("photodepict");
				String photoaddress = result.getString("photoaddress");
				java.sql.Date uploadtime = result.getDate("uploadtime");

				PhotoBean pb = new PhotoBean();
				pb.setPhotoid(photoid);
				pb.setUserid(userid);
				pb.setPhotoname(photoname);
				pb.setPhotoaddress(photoaddress);
				pb.setPhotodepict(photodepict);
				pb.setUploadtime(uploadtime);

				ret.add(pb);
			}
			result.close();
			stm.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}

	public Long getPhotoCount() {
		long l = 0;
		con = GetDbCon.getDbConn();
		try {
			Statement stm = con.createStatement();
			ResultSet result = stm
					.executeQuery("select count(*) from photoinfo");
			if (result.next()) {
				l = result.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return l;
	}

	public void delPhoto(String photoid) throws SQLException {
		con = GetDbCon.getDbConn();
		Statement stm = con.createStatement();
		stm.execute("DELETE FROM photoinfo where photoid ='" + photoid + "'");
	}

	public PhotoBean getSinglePhoto(String photoid) {
		PhotoBean pb = new PhotoBean();

		try {
			con = GetDbCon.getDbConn();
			Statement stm = con.createStatement();
			int photoid1 = Integer.parseInt(photoid);
			ResultSet result = stm
					.executeQuery("select * from photoinfo where photoid = "
							+ photoid1);
			while (result.next()) {
				int albumid = result.getInt("albumid");
				int userid = result.getInt("userid");
				String photoname = result.getString("photoname");
				String photoaddress = result.getString("photoaddress");
				String photodepict = result.getString("photodepict");
				java.sql.Date uploadtime = result.getDate("uploadtime");
				pb.setAlbumid(albumid);
				pb.setUserid(userid);
				pb.setPhotoid(photoid1);
				pb.setPhotoname(photoname);
				pb.setPhotoaddress(photoaddress);
				pb.setPhotodepict(photodepict);
				pb.setUploadtime(uploadtime);
			}
			result.close();
			stm.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pb;
	}

	public void addPhoto(PhotoBean pb) {
		try {

			con = GetDbCon.getDbConn();
			PreparedStatement stm = con
					.prepareStatement("insert into photoinfo(photoname,photoaddress,photodepict,uploadtime,userid,albumid) values(?,?,?,?,?,?)");
			stm.setString(1, pb.getPhotoname());
			stm.setString(2, pb.getPhotoaddress());
			stm.setString(3, pb.getPhotodepict());
			stm.setDate(4, new java.sql.Date(new java.util.Date().getTime()));
			stm.setInt(5, pb.getUserid());
			stm.setInt(6, pb.getAlbumid());
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

	public void updatePhoto(PhotoBean pb) {
		try {

			con = GetDbCon.getDbConn();
			PreparedStatement stm = con
					.prepareStatement("update photoinfo set photoname=?,photodepict=? where photoid=?");
			stm.setString(1, pb.getPhotoname());
			stm.setString(2, pb.getPhotodepict());
			stm.setInt(3, pb.getPhotoid());
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
