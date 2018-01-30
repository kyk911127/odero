package com.sist.place.dao;

import java.util.*;

public class P_ReplyVO {
	private int pr_no;
	private String m_id;
	private String pr_msg;
	private Date pr_regdate;
	private int p_no;
	private int count;
	
	public int getPr_no() {
		return pr_no;
	}
	public void setPr_no(int pr_no) {
		this.pr_no = pr_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getPr_msg() {
		return pr_msg;
	}
	public void setPr_msg(String pr_msg) {
		this.pr_msg = pr_msg;
	}
	public Date getPr_regdate() {
		return pr_regdate;
	}
	public void setPr_regdate(Date pr_regdate) {
		this.pr_regdate = pr_regdate;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}
