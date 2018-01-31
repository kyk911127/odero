package com.sist.main.dao;

public class PathVO {
	private String pathtype;
	private int min;
	private int distance;
	private String firstStartStation;
	private String lastEndStation;
	private String startID;
	private String endID;
	private String payment;
	private String subname;
	
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	public String getPathtype() {
		return pathtype;
	}
	public void setPathtype(String pathtype) {
		this.pathtype = pathtype;
	}
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}
	
	public String getFirstStartStation() {
		return firstStartStation;
	}
	public void setFirstStartStation(String firstStartStation) {
		this.firstStartStation = firstStartStation;
	}
	
	public String getLastEndStation() {
		return lastEndStation;
	}
	public void setLastEndStation(String lastEndStation) {
		this.lastEndStation = lastEndStation;
	}
	public String getStartID() {
		return startID;
	}
	public void setStartID(String startID) {
		this.startID = startID;
	}
	public String getEndID() {
		return endID;
	}
	public void setEndID(String endID) {
		this.endID = endID;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	
}
