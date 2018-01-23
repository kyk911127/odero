package com.sist.masterBoard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

public interface MasterBoardMapper {

	@Select("SELECT no,M_ID,subject,name,regdate,hit,num "
			+"FROM (SELECT no,M_ID,subject,name,regdate,hit,rownum as num "
			+"FROM (SELECT no,M_ID,subject,name,regdate,hit "
			+"FROM masterNotice ORDER BY no DESC)) "
			+"WHERE num BETWEEN #{start} AND #{end}"
			)
	public List<NoticeVO> MasterBoardList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10) FROM masterNotice")
	public int MasterBoardToltalPage();
	
	
	@SelectKey(keyProperty="no",resultType=int.class,before=true,statement="SELECT NVL(MAX(no)+1,1) as no FROM masterNotice"
			)
	@Insert("INSERT INTO masterNotice VALUES("
			+"#{no},'admin','°ü¸®ÀÚ',#{subject},#{content},"
			+"#{pwd},SYSDATE,0)"
			)
	public void MasterBoardInsert(NoticeVO vo);
	
	
	
	
	@Update("UPDATE masterNotice SET "
			+"hit=hit+1 "
			+"WHERE no=#{no}"
			)
	public void MasterBoardHit(int no);
	
	@Select("SELECT no,name,subject,content,regdate "
			+"FROM masterNotice "
			+"WHERE no=#{no}"
			)
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

}
