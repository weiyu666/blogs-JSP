package com.blog.system.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.blog.system.Dto.DailyBean;
import com.blog.system.Dto.UserBean;
import com.blog.util.db.GetDbCon;

public class UserDao {
	private Connection con;
	UserBean ub = new UserBean();

	public void setUser(UserBean ub) {
		this.ub = ub;
	}

	public List<UserBean> getUser(int page, int size) {
		List<UserBean> ret = new ArrayList<UserBean>();
		try {
			int begin = (page - 1) * size;
			con = GetDbCon.getDbConn();
			Statement stm = con.createStatement();
			ResultSet result = stm
					.executeQuery("select * from userinfo where userid>0 order by userid limit "
							+ begin + "," + size);
			while (result.next()) {
				int userid = result.getInt("userid");
				String username = result.getString("username");
				String blogname = result.getString("blogname");
				java.sql.Date regtime = result.getDate("regtime");
				String nickname = result.getString("nickname");

				UserBean ub = new UserBean();
				ub.setNickname(nickname);
				ub.setUserid(userid);
				ub.setBlogname(blogname);
				ub.setUsername(username);
				ub.setRegtime(regtime);
				ret.add(ub);
			}
			result.close();
			stm.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;

	}

	public Long getUserCount() {
		long l = 0;
		con = GetDbCon.getDbConn();
		try {
			Statement stm = con.createStatement();
			ResultSet result = stm
					.executeQuery("select count(*) from userinfo where userid>0");
			if (result.next()) {
				l = result.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return l;
	}

	public void addUser(UserBean ub) {
		try {

			con = GetDbCon.getDbConn();
			PreparedStatement stm = con
					.prepareStatement("insert into userinfo(username,blogname,password,email,nickname,regtime) values(?,?,?,?,?,NOW())");
			stm.setString(1, ub.getUsername());
			stm.setString(2, ub.getBlogname());
			stm.setString(3, ub.getPassword());
			stm.setString(4, ub.getEmail());
			stm.setString(5, ub.getNickname());
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

	public void delUser(String userid) throws SQLException {
		con = GetDbCon.getDbConn();
		Statement stm = con.createStatement();
		stm.execute("DELETE FROM userinfo where userid ='" + userid + "'");
	}

	public UserBean getSingleUser(String userid) {
		UserBean ub = new UserBean();

		try {
			con = GetDbCon.getDbConn();
			Statement stm = con.createStatement();
			int userid1 = Integer.parseInt(userid);
			ResultSet result = stm
					.executeQuery("select * from userinfo where userid = "
							+ userid1);
			while (result.next()) {
				String username = result.getString("username");
				String nickname = result.getString("nickname");
				String blogname = result.getString("blogname");
				String blogsign = result.getString("blogsign");
				String name = result.getString("name");
				int sex = result.getInt("sex");
				String province = result.getString("province");
				String city = result.getString("city");
				String address = result.getString("address");
				String email = result.getString("email");
				String tel = result.getString("tel");
				String profile = result.getString("profile");
				java.sql.Date birthday = result.getDate("birthday");
				java.sql.Date regtime = result.getDate("regtime");
				ub.setNickname(nickname);
				ub.setUserid(userid1);
				ub.setBlogname(blogname);
				ub.setUsername(username);
				ub.setName(name);
				ub.setSex(sex);
				ub.setProvince(province);
				ub.setCity(city);
				ub.setAddress(address);
				ub.setEmail(email);
				ub.setTel(tel);
				ub.setProfile(profile);
				ub.setRegtime(regtime);
				ub.setBlogsign(blogsign);
				ub.setBirthday(birthday);
			}
			result.close();
			stm.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ub;
	}

	public void updateUser(UserBean ub) {
		try {

			con = GetDbCon.getDbConn();
			PreparedStatement stm = con
					.prepareStatement("update userinfo set blogname=?,nickname=?,password=?,email=? where userid="+ub.getUserid());
			stm.setString(1, ub.getBlogname());
			stm.setString(2, ub.getNickname());
			stm.setString(3, ub.getPassword());
			stm.setString(4, ub.getEmail());
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
