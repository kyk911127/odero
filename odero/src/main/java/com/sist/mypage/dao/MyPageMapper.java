package com.sist.mypage.dao;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import java.util.*;
public interface MyPageMapper {

	
	/*
	   //
	   @Select("SELECT no,subject,name,regdate,hit,num "
	         + "FROM (SELECT no,subject,name,regdate,hit,rownum as num "
	         + "FROM (SELECT no,subject,name,regdate,hit "
	         + "FROM springBoard ORDER BY no DESC)) "
	         + "WHERE num BETWEEN #{start} AND #{end}")
	   public List<BoardVO> boardListData(Map map);
	   
	   //
	   @SelectKey(keyProperty="no", resultType=int.class, before=true, statement="SELECT NVL(MAX(no)+1,1) as no FROM springBoard")
	   @Insert("INSERT INTO springBoard VALUES(#{no},#{name},#{subject},#{content},#{pwd},SYSDATE,0)")
	   public void boardInsert(BoardVO vo);
*/
	
	// 마이페이지 - 장소 베스트
	@Results( value = {
			  @Result(property = "jvo.j_no", column = "j_no", id = true),
			  @Result(property = "p_name", column = "p_name"),
			  @Result(property = "p_addr", column = "p_addr"),
			  @Result(property = "p_price", column = "p_price"),
			  @Result(property = "p_keyword", column = "p_keyword"),
			  @Result(property = "p_img", column = "p_img")
			})
	@Select("SELECT j.j_no, p.p_name, p.p_addr, p.p_price, p.p_keyword, p.p_img, p.p_tel, p.p_grade, p.p_time, p.p_hit "
			+ "FROM JJIM j, PLACE p WHERE j.p_no = p.p_no and m_id=#{m_id} ORDER BY j.j_no DESC")
	public List<MyPagePlaceVO> MyPlaceBest5 (String m_id);


	// 마이페이지 - 내정보 
	@Select("SELECT m_id, m_pwd,m_name "
			+ "FROM member "
			+ "WHERE m_id=#{m_id}")
	public MyPageInfoVO MyPageInfoData(String m_id);
		
	
	
}