package com.blog.system.Dto;

public class DailyBean {
	private int dailyid;
	private int userid;
	private String dailyname;
	private String daily;
	private java.sql.Date postingdate;
	private java.sql.Date modifytime;
	private String keyword;
	private String tab;

	public int getDailyid() {
		return dailyid;
	}

	public void setDailyid(int dailyid) {
		this.dailyid = dailyid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getDailyname() {
		return dailyname;
	}

	public void setDailyname(String dailyname) {
		this.dailyname = dailyname;
	}

	public String getDaily() {
		return daily;
	}

	public void setDaily(String daily) {
		this.daily = daily;
	}

	public java.sql.Date getPostingdate() {
		return postingdate;
	}

	public void setPostingdate(java.sql.Date postingdate) {
		this.postingdate = postingdate;
	}

	public java.sql.Date getModifytime() {
		return modifytime;
	}

	public void setModifytime(java.sql.Date modifytime) {
		this.modifytime = modifytime;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getTab() {
		return tab;
	}

	public void setTab(String tab) {
		this.tab = tab;
	}
}
