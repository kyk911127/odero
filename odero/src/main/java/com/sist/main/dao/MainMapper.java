package com.sist.main.dao;
import com.sist.place.dao.*;
import com.sist.review.dao.ReviewVo;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import java.util.*;
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
	
	//BEST RECOMMEND
	 @Select("SELECT r_no,m_id,r_subject,r_pname,r_addr,r_hit,r_regdate,r_imgname,num "
	     + "FROM (SELECT r_no,m_id,r_subject,r_pname,r_addr,r_hit,r_regdate,r_imgname,rownum AS num "
	     + "FROM (SELECT r_no,m_id,r_subject,r_pname,r_addr,r_hit,r_regdate,r_imgname "
	     + "FROM review ORDER BY r_hit DESC)) "
	     + "WHERE num BETWEEN 1 AND 12")
	 public List<ReviewVo> best_recommend(); 
	
	//가성비 데이트 코스 
	@Select("SELECT * FROM place "
			+ "WHERE substr(NVL(p_price,999),1,1)= "
			+ "(SELECT MIN(substr(NVL(p_price,999),1,1)) FROM place) "
			+ "AND p_addr LIKE '%'||#{gu}||'%' AND p_grade=#{p_grade}")
	public List<PlaceVO> best_course(Map map);
	
}
