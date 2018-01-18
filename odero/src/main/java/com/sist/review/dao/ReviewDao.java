package com.sist.review.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao {
	@Autowired
	private ReviewMapper mapper;
	
	//List
	public List<ReviewVo> reviewList(Map map) {
		return mapper.reviewList(map);
	}
	
	//TotalPage
	public int reviewTotalList() {
		return mapper.reviewTotalList();
	}
	
	//Insert
	public void reviewInsert(ReviewVo vo) {
		mapper.reviewInsert(vo);
	}
}
