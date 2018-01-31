package com.sist.course.dao;

import java.util.*;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.place.dao.PlaceVO;

public interface CourseMapper {

	//추천 장소 데이터
	@Select("SELECT p_no, p_name, p_addr, p_tel, p_hit, p_grade "
			+ "FROM place "
			+ "WHERE p_no = #{no}")
	public PlaceVO course_place_data(int no);
	
    //맛집키워드
    @Select("SELECT p_keyword FROM place "
    		+ "WHERE p_grade=#{p_grade} "
    		+ "AND REGEXP_LIKE(p_addr,#{gulist})")
    public List<String> course_fkeyword(Map map);
    
    //각각의 카테고리 테이블 데이터 삭제
    @Delete("DELETE FROM sfood")
    public void sfood_delete();
    
    //맛집테이블에 키워드 넣기
    @Insert("INSERT INTO sfood VALUES(#{sf_key}, #{sf_grade})")
    public void sfood_insert(Map map);
    
    //각테이블마다 중복제거 
    @Select("SELECT DISTINCT sf_key FROM sfood WHERE sf_grade = #{sf_grade}")
    public List<String> sfood_distinct(String sf_grade);
    
    //장소 리스트 가져오기(사용자가 선택한)
    @Select("SELECT p_no, p_name, p_addr, p_img, p_tel, "
    		+ "p_grade, p_time, p_hit "
    		+ "FROM place "
    		+ "WHERE p_grade=#{p_grade} "
    		+ "AND REGEXP_LIKE(p_addr,#{gulist}) "
    		+ "AND REGEXP_LIKE(p_keyword,#{keylist})")
    public List<PlaceVO> getPlaceInfo(Map map);
    
    
    
    
    
    
    
    
    
}


