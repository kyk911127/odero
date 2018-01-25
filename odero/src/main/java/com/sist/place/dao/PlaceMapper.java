package com.sist.place.dao;

import org.apache.ibatis.annotations.Select;
import java.util.*;

public interface PlaceMapper {
	@Select("SELECT p_no, p_name, p_addr, p_price, p_keyword, p_img, p_tel, p_grade, p_time "
			+ "FROM place "
			+ "WHERE p_no=#{p_no}")
	public PlaceVO placeDetailData(int p_no);
	
	@Select("SELECT p_no,p_name,p_addr,p_price,p_keyword,p_img,num "
			+"FROM ( SELECT p_no,p_name,p_addr,p_price,p_keyword,p_img,rownum AS num "
			+"FROM (SELECT p_no,p_name,p_addr,p_price,p_keyword,p_img "
			+"FROM place ORDER BY p_no ASC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<PlaceVO> placeListData(Map map);
	
	@Select("SELECT COUNT(*) FROM place")
	public int placeTotalList();
}
