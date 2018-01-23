package com.sist.place.dao;

import org.apache.ibatis.annotations.Select;

public interface PlaceMapper {
	@Select("SELECT p_no, p_name, p_addr, p_price, p_keyword, p_img, p_tel, p_grade, p_time "
			+ "FROM place "
			+ "WHERE p_no=#{p_no}")
	public PlaceVO placeDetailData(int p_no);
	
}
