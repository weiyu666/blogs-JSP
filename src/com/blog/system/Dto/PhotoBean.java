package com.blog.system.Dto;

public class PhotoBean {
	private int userid;
	private int photoid;
	private int albumid;
	private String photoname;
	private String photoaddress;
	private String photodepict;
	private java.sql.Date uploadtime;

	public int getPhotoid() {
		return photoid;
	}

	public void setPhotoid(int photoid) {
		this.photoid = photoid;
	}

	public String getPhotoname() {
		return photoname;
	}

	public void setPhotoname(String photoname) {
		this.photoname = photoname;
	}

	public String getPhotoaddress() {
		return photoaddress;
	}

	public void setPhotoaddress(String photoaddress) {
		this.photoaddress = photoaddress;
	}

	public String getPhotodepict() {
		return photodepict;
	}

	public void setPhotodepict(String photodepict) {
		this.photodepict = photodepict;
	}

	public java.sql.Date getUploadtime() {
		return uploadtime;
	}

	public void setUploadtime(java.sql.Date uploadtime) {
		this.uploadtime = uploadtime;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getAlbumid() {
		return albumid;
	}

	public void setAlbumid(int albumid) {
		this.albumid = albumid;
	}

}
