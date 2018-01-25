package com.sist.review.dao;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVo {
	private int r_no;
	private String m_id;
	private String r_subject;
	private String r_pname;
	private String r_content;
	private String r_hit;
	private Date r_reddate;
	private String r_imgname;
	private int r_imgcount; 
	private String r_addr;
	private List<MultipartFile> images;
	
	public List<MultipartFile> getImages() {
		return images;
	}
	public void setImages(List<MultipartFile> images) {
		this.images = images;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getR_subject() {
		return r_subject;
	}
	public void setR_subject(String r_subject) {
		this.r_subject = r_subject;
	}
	public String getR_pname() {
		return r_pname;
	}
	public void setR_pname(String r_pname) {
		this.r_pname = r_pname;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_hit() {
		return r_hit;
	}
	public void setR_hit(String r_hit) {
		this.r_hit = r_hit;
	}
	public Date getR_reddate() {
		return r_reddate;
	}
	public void setR_reddate(Date r_reddate) {
		this.r_reddate = r_reddate;
	}
	public String getR_addr() {
		return r_addr;
	}
	public void setR_addr(String r_addr) {
		this.r_addr = r_addr;
	}
	public String getR_imgname() {
		return r_imgname;
	}
	public void setR_imgname(String r_imgname) {
		this.r_imgname = r_imgname;
	}
	public int getR_imgcount() {
		return r_imgcount;
	}
	public void setR_imgcount(int r_imgcount) {
		this.r_imgcount = r_imgcount;
	}
}
