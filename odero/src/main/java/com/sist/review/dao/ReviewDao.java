package com.sist.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
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
	
	// HIT++
	public void reviewHitIncrement(int no){
		mapper.reviewHitIncrement(no);
	}
	
	// Detail
	public ReviewVo reviewDetail(int no){
		return mapper.reviewDetail(no);
	}
	
	// Update
	public void reviewUpdateData(int no){
		mapper.reviewUpdateData(no);
	}
	
	// Delete
	public ReviewVo reviewDeleteData(int no) {
		return mapper.reviewDeleteData(no);
	}
	public void reviewDelete(int no){
		mapper.reviewDelete(no);
	}
}
