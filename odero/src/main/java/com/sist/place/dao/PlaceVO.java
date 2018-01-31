package com.sist.place.dao;

/*
 *  P_NO                                      NOT NULL NUMBER
 P_NAME                                    NOT NULL VARCHAR2(500)
 P_ADDR                                    NOT NULL VARCHAR2(1000)
 P_PRICE                                            VARCHAR2(100)
 P_KEYWORD                                          VARCHAR2(1000)
 P_IMG                                     NOT NULL VARCHAR2(2000)
 P_TEL                                              VARCHAR2(20)
 P_GRADE                                            CHAR(1)
 P_TIME                                             VARCHAR2(200)
 P_HIT                                              NUMBER
 */
public class PlaceVO {
	private int p_no;
	private String p_name;
	private String p_addr;
	private String p_price;
	private String p_keyword;
	private String p_img;
	private String p_tel;
	private String p_grade;
	private String p_time;
	private String p_coords;
	private int p_hit;
	private int count;

	public String getP_coords() {
		return p_coords;
	}
	public void setP_coords(String p_coords) {
		this.p_coords = p_coords;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_addr() {
		return p_addr;
	}
	public void setP_addr(String p_addr) {
		this.p_addr = p_addr;
	}
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	public String getP_keyword() {
		return p_keyword;
	}
	public void setP_keyword(String p_keyword) {
		this.p_keyword = p_keyword;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public String getP_tel() {
		return p_tel;
	}
	public void setP_tel(String p_tel) {
		this.p_tel = p_tel;
	}
	public String getP_grade() {
		return p_grade;
	}
	public void setP_grade(String p_grade) {
		this.p_grade = p_grade;
	}
	public String getP_time() {
		return p_time;
	}
	public void setP_time(String p_time) {
		this.p_time = p_time;
	}
	public int getP_hit() {
		return p_hit;
	}
	public void setP_hit(int p_hit) {
		this.p_hit = p_hit;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}
