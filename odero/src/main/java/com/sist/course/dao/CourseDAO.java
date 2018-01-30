package com.sist.course.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.place.dao.PlaceVO;

@Repository
public class CourseDAO {
	@Autowired
	private CourseMapper mapper;
	
	public PlaceVO course_place_data(int no) {
		return mapper.course_place_data(no);
	}
}
