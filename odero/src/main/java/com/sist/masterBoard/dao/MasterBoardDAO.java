package com.sist.masterBoard.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.masterBoard.dao.*;

import java.util.*;

@Repository
public class MasterBoardDAO {
	@Autowired
	private  MasterBoardMapper mapper;

	public List<NoticeVO> MasterBoardList(Map map){
		return mapper.MasterBoardList(map);
	}
	public int MasterBoardToltalPage(){
		return mapper.MasterBoardToltalPage();
	}
	public int MasterBoardRowCount(){
		return mapper.MasterBoardRowCount();
	}


	public void MasterBoardInsert(NoticeVO vo){
		mapper.MasterBoardInsert(vo);
	}

	public void MasterBoardReplyInsert(NoticeVO vo){
		vo.setGroup_id(mapper.group_id(vo.getNo())); 
		vo.setGroup_step(mapper.group_step(vo.getNo())); 
		vo.setGroup_tab(mapper.group_tab(vo.getNo()));
		vo.setPno(vo.getNo());

		mapper.groupUpdate(vo);
		mapper.MasterBoardReplyInsert(vo);
		mapper.depthUpdate(vo.getNo());
	}


	public NoticeVO MasterBoardContent(int no)	{
		mapper.MasterBoardHit(no);
		return mapper.MasterBoardContent(no);
	}



	public NoticeVO MasterBoardUpdate(int no){
		return mapper.MasterBoardContent(no);
	}

	public boolean MasterBoardUpdate_ok(NoticeVO vo){
		boolean bCheck=false;
		String pwd=mapper.boardGetPwd(vo.getNo());

		if(pwd.equals(vo.getPwd())) {
			bCheck=true;
			mapper.MasterBoardUpdate(vo);
		}

		return bCheck;
	}

	public boolean MasterBoardDelete_ok(int no,String pwd)  {
		boolean bCheck=false;
		String db_pwd=mapper.boardGetPwd(no);
		if(db_pwd.equals(pwd))  {
			bCheck=true;
			mapper.MasterBoardDelete(no);
		}
		return bCheck;
	}

	public List<ReplyVO> replyListData(Map map){
		return mapper.replyListData(map);
	}

	public void replyNewInsert(Map map){
		mapper.replyNewInsert(map);
	}

	public ReplyVO replyGetParentInfo(int no) {
		ReplyVO vo=new ReplyVO();
		vo= mapper.replyGetParentInfo(no);
		return vo;
	}

	public void replyStepIncrement(ReplyVO vo){
		mapper.replyStepIncrement(vo);
	}


	public void replyRepyInsert(ReplyVO vo)	{
		mapper.replyRepyInsert(vo);
	}
	
	public void replyDepthIncrement(int no)	{
			mapper.replyDepthIncrement(no);
	}
	
	
}
