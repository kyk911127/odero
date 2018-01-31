package com.sist.place.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public class P_ReplyDAO {
	@Autowired
	private PlaceMapper mapper;
	
	public List<P_ReplyVO> p_replyListData(int p_no) {
		return mapper.p_replyListData(p_no);
	}
	
	public void p_replyInsert(P_ReplyVO vo) {
		mapper.p_replyInsert(vo);
	}
	
	public void p_replyUpdate(P_ReplyVO vo) {
		mapper.p_replyUpdate(vo);
	}
	
	public void p_replyDelete(int pr_no) {
		mapper.p_replyDelete(pr_no);
	}
	
	public int p_replyCount(int p_no) {
		return mapper.p_replyCount(p_no);
	}
}
