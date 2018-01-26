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
	public void MasterBoardInsert(NoticeVO vo){
		mapper.MasterBoardInsert(vo);
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
}
