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
			+ "ORDER BY p_hit DESC)) "
			+ "WHERE num BETWEEN 1 and 3")
	public List<PlaceVO> best_food();
	
}
