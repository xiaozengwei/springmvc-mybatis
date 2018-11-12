package com.xiao.entity;

public class Visit {
	public int getVisitid() {
		return Visitid;
	}
	public void setVisitid(int visitid) {
		Visitid = visitid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getVisitdate() {
		return Visitdate;
	}
	public void setVisitdate(String visitdate) {
		Visitdate = visitdate;
	}
	public String getVisitIP() {
		return VisitIP;
	}
	public void setVisitIP(String visitIP) {
		VisitIP = visitIP;
	}
	private int Visitid;
	private User user;
	private String Visitdate;
	private String VisitIP;
	
}
