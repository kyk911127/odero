package com.sist.cart.dao;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

public interface CartMapper {
/*
	   //페이지별 목록출력
	   @Select("SELECT no,subject,name,regdate,hit,num "
	         + "FROM (SELECT no,subject,name,regdate,hit,rownum as num "
	         + "FROM (SELECT no,subject,name,regdate,hit "
	         + "FROM springBoard ORDER BY no DESC)) "
	         + "WHERE num BETWEEN #{start} AND #{end}")
	   public List<BoardVO> boardListData(Map map);
	   
	   //새글
	   @SelectKey(keyProperty="no", resultType=int.class, before=true, statement="SELECT NVL(MAX(no)+1,1) as no FROM springBoard")
	   @Insert("INSERT INTO springBoard VALUES(#{no},#{name},#{subject},#{content},#{pwd},SYSDATE,0)")
	   public void boardInsert(BoardVO vo);
*/
	@Select("SELECT p_no, p_name, p_addr, p_price, p_keyword, p_img, p_tel, p_grade, p_time, p_hit "
			+ "FROM place "
			+ "WHERE p_no < 6")
	public List<CartPlaceVO> CartPlaceBest5 ();
	
}
