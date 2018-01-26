package com.sist.main.dao;
import com.sist.place.dao.*;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface MainMapper {
	//BEST FOOD
	@Select("SELECT p_img, p_name, p_addr, p_no, num "
			+ "FROM (SELECT p_img, p_name, p_addr, p_no, rownum as num "
			+ "FROM (SELECT p_img, p_name, p_addr, p_no "
			+ "FROM place "
			+ "WHERE p_grade='f' "
			+ "ORDER BY NVL(p_hit,0) DESC)) "
			+ "WHERE num BETWEEN 1 and 3")
	public List<PlaceVO> best_food();
	
	//BEST PLAY
	@Select("SELECT p_img, p_name, p_addr, p_no, num "
			+ "FROM (SELECT p_img, p_name, p_addr, p_no, rownum as num "
			+ "FROM (SELECT p_img, p_name, p_addr, p_no "
			+ "FROM place "
			+ "WHERE p_grade='p' "
			+ "ORDER BY NVL(p_hit,0) DESC)) "
			+ "WHERE num BETWEEN 1 and 3")
	public List<PlaceVO> best_play();
	
	//가성비 데이트 코스 
	@Select("SELECT p_price,p_name,p_addr FROM place "
			+ "WHERE substr(NVL(p_price,999),1,1)= "
			+ "(SELECT MIN(substr(NVL(p_price,999),1,1)) FROM place) "
			+ "AND p_addr LIKE '%#{gu}%' AND p_grade='#{p_grade}' AND p_price LIKE '%이하%'")
	public List<PlaceVO> best_course(String p_grade, String gu);
	
}
