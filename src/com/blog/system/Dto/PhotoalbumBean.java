package com.blog.system.Dto;

public class PhotoalbumBean {
	private int albumid;
	private int userid;
	private String albumname;
	private String albumdepict;
	private java.sql.Date createtime;
	public int getAlbumid() {
		return albumid;
	}
	public void setAlbumid(int albumid) {
		this.albumid = albumid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getAlbumname() {
		return albumname;
	}
	public void setAlbumname(String albumname) {
		this.albumname = albumname;
	}
	public String getAlbumdepict() {
		return albumdepict;
	}
	public void setAlbumdepict(String albumdepict) {
		this.albumdepict = albumdepict;
	}
	public java.sql.Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(java.sql.Date createtime) {
		this.createtime = createtime;
	}
}
