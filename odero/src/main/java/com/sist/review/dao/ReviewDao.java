package com.sist.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
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
	public void reviewUpdateData(ReviewVo vo){
		mapper.reviewUpdateData(vo);
	}
	
	// Delete
	public ReviewVo reviewDeleteData(int no) {
		return mapper.reviewDeleteData(no);
	}
	public void reviewDelete(int no){
		mapper.reviewDelete(no);
	}
	
	// Reply_Insert
	public void replyInsert(Review_ReplyVo vo){
		mapper.replyInsert(vo);
	}
	
	// Reply_List
	public List<Review_ReplyVo> replyList(Map map){
		return mapper.replyList(map);
	}
	
	// Reply_totalPage
	public int replyTotalList(int no){
		return mapper.replyTotalList(no);
	}
	
	
	// Re_ReplyInser
	public Review_ReplyVo re_replyParent(int no){
		return mapper.re_replyParent(no);
	}
	public void re_replySort(Review_ReplyVo vo){
		mapper.re_replySort(vo);
	}
	
	public void re_replyInsert(Review_ReplyVo vo){
		mapper.re_replyInsert(vo);
	}
}
