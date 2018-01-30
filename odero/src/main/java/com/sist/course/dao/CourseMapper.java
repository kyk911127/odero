package com.sist.course.dao;

import org.apache.ibatis.annotations.Select;

import com.sist.place.dao.PlaceVO;

public interface CourseMapper {

	//추천 장소 데이터
	@Select("SELECT p_no, p_name, p_addr, p_tel, p_hit, p_grade "
			+ "FROM place "
			+ "WHERE p_no = #{no}")
	public PlaceVO course_place_data(int no);
}
