package com.blog.system.Dto;

public class MessageBean {
	private int messageid;
	private int blogid;
	private int userid;
	private String nickname;
	private String message;
	private java.sql.Date messagetime;

	public int getMessageid() {
		return messageid;
	}

	public void setMessageid(int messageid) {
		this.messageid = messageid;
	}

	public int getBlogid() {
		return blogid;
	}

	public void setBlogid(int blogid) {
		this.blogid = blogid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public java.sql.Date getMessagetime() {
		return messagetime;
	}

	public void setMessagetime(java.sql.Date messagetime) {
		this.messagetime = messagetime;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}
