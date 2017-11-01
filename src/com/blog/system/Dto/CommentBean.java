package com.blog.system.Dto;

public class CommentBean {
	private int commentid;
	private int userid;
	private int pdid;
	private String commentname;
	private String comment;
	private java.sql.Date commenttime;
	private int flag;

	public int getCommentid() {
		return commentid;
	}

	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getPdid() {
		return pdid;
	}

	public void setPdid(int pdid) {
		this.pdid = pdid;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public java.sql.Date getCommenttime() {
		return commenttime;
	}

	public void setCommenttime(java.sql.Date commenttime) {
		this.commenttime = commenttime;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public String getCommentname() {
		return commentname;
	}

	public void setCommentname(String commentname) {
		this.commentname = commentname;
	}

}
