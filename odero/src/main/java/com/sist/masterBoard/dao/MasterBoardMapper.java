package com.sist.masterBoard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

public interface MasterBoardMapper {
	@Select("SELECT no,M_ID,subject,name,regdate,hit,group_tab,num "
			+"FROM (SELECT no,M_ID,subject,name,regdate,hit,group_tab,rownum as num "
			+"FROM (SELECT no,M_ID,subject,name,regdate,hit,group_tab "
			+"FROM masterNotice ORDER BY group_id DESC,group_step ASC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<NoticeVO> MasterBoardList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10) FROM masterNotice")
	public int MasterBoardToltalPage();
	
	@Select("SELECT COUNT(*) FROM masterNotice")
	public int MasterBoardRowCount();
	
	
	
	@SelectKey(keyProperty="no",resultType=int.class,before=true,statement="SELECT NVL(MAX(no)+1,1) as no FROM masterNotice")
	@Insert("INSERT INTO masterNotice(no,M_ID,name,subject,content,pwd,regdate,hit,group_id) VALUES("
			+"#{no},'admin',#{name},#{subject},#{content},"
			+"#{pwd},SYSDATE,0,(SELECT NVL(MAX(group_id)+1,1) FROM masterNotice))")
	public void MasterBoardInsert(NoticeVO vo);
	
	

	@Update("UPDATE masterNotice SET "
			+"hit=hit+1 "
			+"WHERE no=#{no}")
	public void MasterBoardHit(int no);
	
	@Select("SELECT no,name,subject,content,regdate "
			+"FROM masterNotice "
			+"WHERE no=#{no}")
	public NoticeVO MasterBoardContent(int no);
	
	
	
	
	@Select("SELECT pwd FROM masterNotice "
			+"WHERE no=#{no}")
	public String boardGetPwd(int no);

	@Update("UPDATE masterNotice SET "
			+"name=#{name},subject=#{subject},"
			+"content=#{content} "
			+"WHERE no=#{no}")
	public void MasterBoardUpdate(NoticeVO vo);
	
	@Delete("DELETE FROM masterNotice "
			 +"WHERE no=#{no}")
	public void MasterBoardDelete(int no);
	
	
	
	
	@Select("SELECT group_id FROM masterNotice WHERE no=#{no}")
	public int group_id(int no);
	@Select("SELECT group_step FROM masterNotice WHERE no=#{no}")
	public int group_step(int no);
	@Select("SELECT group_tab FROM masterNotice WHERE no=#{no}")
	public int group_tab(int no);
	
	
	@Update("UPDATE masterNotice SET "
			+"group_step=group_step+1 "
			+"WHERE group_id=#{group_id} AND group_step>#{group_step}")
	public void groupUpdate(NoticeVO vo);
	
	
	@SelectKey(keyProperty="no",resultType=int.class,before=true,statement="SELECT NVL(MAX(no)+1,1) as no FROM masterNotice")
	@Insert("INSERT INTO masterNotice(no,M_ID,name,subject,content,pwd,regdate,hit,group_id,group_step,group_tab,root) "
			+ "VALUES(#{no},'admin',#{name},#{subject},#{content},#{pwd},SYSDATE,0,"
			+ "(SELECT NVL(MAX(group_id)+1,1) FROM masterNotice),#{group_step}+1,#{group_tab}+1,#{pno}) ")
	public void MasterBoardReplyInsert(NoticeVO vo);

	@Update("UPDATE masterNotice SET "
			+"depth=depth+1 "
			+"WHERE no=#{pno}")
	public void depthUpdate(int pno);


	
	

}
