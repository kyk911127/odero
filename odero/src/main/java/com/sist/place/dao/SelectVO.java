package com.sist.place.dao;

public class SelectVO {
	
	private String play;   
	private String food;
	private String gb;
	private String gn;
	private String gb_d[] ={ "마포구", "서대문구" ,"은평구" ,"용산구" ,"중구" ,"종로구","성동구", "동대문구", "성북구", "광진구", "중랑구", "노원구", "강북구", "도봉구"};
	private String gn_d[] ={ "강서구", "구로구", "양천구", "금천구" , "영등포구", "관악구" ,"동작구", "서초구", "강남구", "송파구", "강동구"};
	
	public String getPlay() {
		return play;
	}
	public void setPlay(String play) {
		this.play = play;
	}
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public String getGb() {
		return gb;
	}
	public void setGb(String gb) {
		this.gb = gb;
	}
	public String getGn() {
		return gn;
	}
	public void setGn(String gn) {
		this.gn = gn;
	}
	public String[] getGb_d() {
		return gb_d;
	}
	public void setGb_d(String[] gb_d) {
		this.gb_d = gb_d;
	}
	public String[] getGn_d() {
		return gn_d;
	}
	public void setGn_d(String[] gn_d) {
		this.gn_d = gn_d;
	}
	
	

}
