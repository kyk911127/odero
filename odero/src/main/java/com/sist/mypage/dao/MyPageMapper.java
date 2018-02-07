package com.sist.mypage.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
*/
	
	// 마이페이지 - 장소 베스트
	@Results( value = {
			  @Result(property = "jvo.j_no", column = "j_no", id = true),
			  @Result(property = "p_no", column = "p_no"),
			  @Result(property = "p_name", column = "p_name"),
			  @Result(property = "p_addr", column = "p_addr"),
			  @Result(property = "p_price", column = "p_price"),
			  @Result(property = "p_keyword", column = "p_keyword"),
			  @Result(property = "p_img", column = "p_img")
			})
	@Select("SELECT j.j_no, p.p_no, p.p_name, p.p_addr, p.p_price, p.p_keyword, NVL(SUBSTR(p.p_img,1,INSTR(p.p_img,',',1,1)-1),p.p_img) AS p_img, p.p_tel, p.p_grade, p.p_time, p.p_hit "
			+ "FROM JJIM j, PLACE p WHERE j.p_no = p.p_no and m_id=#{m_id} ORDER BY j.j_no DESC")
	public List<MyPagePlaceVO> MyPlaceBest5 (String m_id);
	
	
	
	
	/*SELECT
	event_no,event_category,event_image,event_title,event_day,event_place,event_id,event_hit,num
	FROM (SELECT
	event_no,event_category,event_image,event_title,event_day,event_place,event_id,event_hit,rownum
	as num
	FROM (SELECT
	event_no,event_category,event_image,event_title,event_day,event_place,event_id,event_hit
	FROM gggl_event ORDER BY event_no DESC))
	WHERE num BETWEEN #{start} AND*/
	
	// 마이페이지 - 장소 (페이지)
		@Results( value = {
				  @Result(property = "jvo.j_no", column = "j_no", id = true),
				  @Result(property = "p_no", column = "p_no"),
				  @Result(property = "p_name", column = "p_name"),
				  @Result(property = "p_addr", column = "p_addr"),
				  @Result(property = "p_price", column = "p_price"),
				  @Result(property = "p_keyword", column = "p_keyword"),
				  @Result(property = "p_img", column = "p_img")
				})
		@Select("SELECT j_no, p_no, p_name, p_addr, p_price, p_keyword, p_img, p_tel, p_grade, p_time, p_hit, num "
				+ "FROM (SELECT j_no, p_no, p_name, p_addr, p_price, p_keyword, p_img, p_tel, p_grade, p_time, p_hit, rownum as num "
				+ "FROM (SELECT j.j_no, p.p_no, p.p_name, p.p_addr, p.p_price, p.p_keyword, NVL(SUBSTR(p.p_img,1,INSTR(p.p_img,',',1,1)-1),p.p_img) AS p_img, p.p_tel, p.p_grade, p.p_time, p.p_hit " 
				+ "FROM JJIM j, PLACE p WHERE j.p_no = p.p_no and m_id=#{m_id} ORDER BY j.j_no DESC)) "
				+ "WHERE num BETWEEN #{start} AND #{end}")
		public List<MyPagePlaceVO>MyPlacePage(Map map);
		
		// 마이페이지 - 놀거리(코스) (페이지)
				@Results( value = {
						  @Result(property = "c_no", column = "c_no", id = true),
						  @Result(property = "pvo.p_name", column = "p_name"),
						  @Result(property = "pvo.p_no", column = "p_no"),
						  @Result(property = "pvo.p_addr", column = "p_addr"),
						  @Result(property = "pvo.p_keyword", column = "p_keyword"),
						  @Result(property = "pvo.p_img", column = "p_img"),
						  @Result(property = "pvo.p_price", column = "p_price"),
						  @Result(property = "pvo.p_hit", column = "p_hit")
						})
				@Select("SELECT c_no, p_name, p_no, p_addr, p_keyword, p_img, p_price, p_hit, num "
						+ "FROM (SELECT c_no, p_name, p_no, p_addr, p_keyword, p_img, p_price, p_hit, rownum as num "
						+ "FROM (SELECT c.c_no, p.p_name, p.p_no, p.p_addr, p.p_keyword, NVL(SUBSTR(p.p_img,1,INSTR(p.p_img,',',1,1)-1),p.p_img) AS p_img, p.p_price, p.p_hit "
						+ "FROM COURSE c, PLACE p WHERE c.c_play = p.p_no AND m_id=#{m_id} ORDER BY c.c_no DESC)) "
						+ "WHERE num BETWEEN #{start} AND #{end} ")
				public List<MyPageCosVO> MyCosPage (Map map);	
		
		//TotalPage
		@Select("SELECT CEIL(COUNT(*)/12) FROM jjim WHERE m_id=#{m_id} ")
		public int MyPageJJimTotal(String m_id);
		
		//TotalPage
		@Select("SELECT CEIL(COUNT(*)/12) FROM course WHERE m_id=#{m_id} ")
		public int MyPageCosTotal(String m_id);
		
		
		/*
		 * @Select("SELECT j.j_no, p.p_no, p.p_name, p.p_addr, p.p_price, p.p_keyword, p_img, p.p_tel, p.p_grade, p.p_time, p.p_hit, num "
				+ "FROM (SELECT j.j_no, p.p_no, p.p_name, p.p_addr, p.p_price, p.p_keyword, p_img AS p_img, p.p_tel, p.p_grade, p.p_time, p.p_hit, rownum as num "
				+ "FROM (SELECT j.j_no, p.p_no, p.p_name, p.p_addr, p.p_price, p.p_keyword, NVL(SUBSTR(p.p_img,1,INSTR(p.p_img,',',1,1)-1),p.p_img) AS p_img, p.p_tel, p.p_grade, p.p_time, p.p_hit " 
				+ "FROM JJIM j, PLACE p ORDER BY j.j_no DESC)) "
				+ "WHERE j.p_no = p.p_no and m_id=#{m_id} AND num BETWEEN #{start} AND #{end}")
		 * 
		 * SELECT j_no, p_no, p_name,p_addr, p_price, p_keyword, p_img, p_tel, p_grade, p_time, p_hit, num
FROM (SELECT j_no,p_no, p_name, p_addr, p_price, p_keyword, p_img,p_tel,p_grade,p_time,p_hit, rownum as num 
FROM (SELECT j.j_no, p.p_no, p.p_name, p.p_addr, p.p_price, p.p_keyword, NVL(SUBSTR(p.p_img,1,INSTR(p.p_img,',',1,1)-1),p.p_img) AS p_img, p.p_tel, p.p_grade, p.p_time, p.p_hit
FROM JJIM j join PLACE p ON j.p_no = p.p_no WHERE m_id='01059231010' ORDER BY j.j_no DESC))
WHERE num BETWEEN 1 AND 10; 
		 * 
		 * 
		 */
	
	// 마이페이지 - 코스 베스트 (food)
		@Results( value = {
				  @Result(property = "c_no", column = "c_no", id = true),
				  @Result(property = "pvo.p_name", column = "p_name"),
				  @Result(property = "pvo.p_no", column = "p_no"),
				  @Result(property = "pvo.p_addr", column = "p_addr"),
				  @Result(property = "pvo.p_keyword", column = "p_keyword"),
				  @Result(property = "pvo.p_img", column = "p_img"),
				  @Result(property = "pvo.p_price", column = "p_price"),
				  @Result(property = "pvo.p_hit", column = "p_hit")
				})
		@Select("SELECT c.c_no, p.p_name, p.p_no, p.p_addr, p.p_keyword, p.p_img, p.p_price, p.p_hit "
				+ "FROM COURSE c, PLACE p WHERE c.c_food = p.p_no AND m_id=#{m_id} ORDER BY c.c_no DESC")
		public List<MyPageCosVO> MyCosBestFood (String m_id);
		// 마이페이지 - 코스 베스트 (cafe)
		@Results( value = {
				  @Result(property = "c_no", column = "c_no", id = true),
				  @Result(property = "pvo.p_name", column = "p_name"),
				  @Result(property = "pvo.p_no", column = "p_no"),
				  @Result(property = "pvo.p_addr", column = "p_addr"),
				  @Result(property = "pvo.p_keyword", column = "p_keyword"),
				  @Result(property = "pvo.p_img", column = "p_img"),
				  @Result(property = "pvo.p_price", column = "p_price"),
				  @Result(property = "pvo.p_hit", column = "p_hit")
				})
		@Select("SELECT c.c_no, p.p_name, p.p_no, p.p_addr, p.p_keyword, p.p_img, p.p_price, p.p_hit "
				+ "FROM COURSE c, PLACE p WHERE c.c_cafe = p.p_no AND m_id=#{m_id} ORDER BY c.c_no DESC")
		public List<MyPageCosVO> MyCosBestCafe (String m_id);		
		// 마이페이지 - 코스 베스트 (play)
		@Results( value = {
				  @Result(property = "c_no", column = "c_no", id = true),
				  @Result(property = "pvo.p_name", column = "p_name"),
				  @Result(property = "pvo.p_no", column = "p_no"),
				  @Result(property = "pvo.p_addr", column = "p_addr"),
				  @Result(property = "pvo.p_keyword", column = "p_keyword"),
				  @Result(property = "pvo.p_img", column = "p_img"),
				  @Result(property = "pvo.p_price", column = "p_price"),
				  @Result(property = "pvo.p_hit", column = "p_hit")
				})
		@Select("SELECT c.c_no, p.p_name, p.p_no, p.p_addr, p.p_keyword, NVL(SUBSTR(p.p_img,1,INSTR(p.p_img,',',1,1)-1),p.p_img) AS p_img, p.p_price, p.p_hit "
				+ "FROM COURSE c, PLACE p WHERE c.c_play = p.p_no AND m_id=#{m_id} ORDER BY c.c_no DESC")
		public List<MyPageCosVO> MyCosBestPlay (String m_id);		


	// 마이페이지 - 내정보 
	@Select("SELECT m_id, m_pwd,m_name "
			+ "FROM member "
			+ "WHERE m_id=#{m_id}")
	public MyPageInfoVO MyPageInfoData(String m_id);
	
	// 닉네임수정
	@Update("UPDATE MEMBER SET m_name = #{m_name} WHERE m_id = #{m_id}")
	public void nickChange(MyPageInfoVO vo);
	
	// 비밀번호수정
	@Update("UPDATE MEMBER SET m_pwd = #{m_pwd} WHERE m_id = #{m_id}")
	public void pwdChange(MyPageInfoVO vo);
	// 찜삭제
	@Delete("DELETE FROM jjim WHERE m_id = #{m_id} AND j_no=#{no}")
	public void placeDelete(String m_id, int no);
	@Delete("DELETE FROM jjim WHERE j_no=#{no}")
	public void placeDeleteNo(int no);
	@Delete("DELETE FROM course WHERE c_no=#{no}")
	public void	cosDeleteNo(int no);
	
	
	// 코스보기 - 놀거리
	@Results( value = {
			  @Result(property = "c_no", column = "c_no", id = true),
			  @Result(property = "pvo.p_name", column = "p_name"),
			  @Result(property = "pvo.p_no", column = "p_no"),
			  @Result(property = "pvo.p_addr", column = "p_addr"),
			  @Result(property = "pvo.p_keyword", column = "p_keyword"),
			  @Result(property = "pvo.p_img", column = "p_img"),
			  @Result(property = "pvo.p_price", column = "p_price"),
			  @Result(property = "pvo.p_hit", column = "p_hit")
			})
	@Select("SELECT c.c_no, p.p_name, p.p_no, p.p_addr, p.p_keyword, NVL(SUBSTR(p.p_img,1,INSTR(p.p_img,',',1,1)-1),p.p_img) AS p_img, p.p_price, p.p_hit "
			+ "FROM COURSE c, PLACE p WHERE c.c_play = p.p_no AND c.c_no=#{no} ")
	public MyPageCosVO CosDetailPlay (int no);		
	
	// 코스보기 - 카페
	@Results( value = {
			  @Result(property = "c_no", column = "c_no", id = true),
			  @Result(property = "pvo.p_name", column = "p_name"),
			  @Result(property = "pvo.p_no", column = "p_no"),
			  @Result(property = "pvo.p_addr", column = "p_addr"),
			  @Result(property = "pvo.p_keyword", column = "p_keyword"),
			  @Result(property = "pvo.p_img", column = "p_img"),
			  @Result(property = "pvo.p_price", column = "p_price"),
			  @Result(property = "pvo.p_hit", column = "p_hit")
			})
	@Select("SELECT c.c_no, p.p_name, p.p_no, p.p_addr, p.p_keyword, NVL(SUBSTR(p.p_img,1,INSTR(p.p_img,',',1,1)-1),p.p_img) AS p_img, p.p_price, p.p_hit "
			+ "FROM COURSE c, PLACE p WHERE c.c_cafe = p.p_no AND c.c_no=#{no} ")
	public MyPageCosVO CosDetailCafe (int no);		
	
	// 코스보기 - 맛집
	@Results( value = {
			  @Result(property = "c_no", column = "c_no", id = true),
			  @Result(property = "pvo.p_name", column = "p_name"),
			  @Result(property = "pvo.p_no", column = "p_no"),
			  @Result(property = "pvo.p_addr", column = "p_addr"),
			  @Result(property = "pvo.p_keyword", column = "p_keyword"),
			  @Result(property = "pvo.p_img", column = "p_img"),
			  @Result(property = "pvo.p_price", column = "p_price"),
			  @Result(property = "pvo.p_hit", column = "p_hit")
			})
	@Select("SELECT c.c_no, p.p_name, p.p_no, p.p_addr, p.p_keyword, NVL(SUBSTR(p.p_img,1,INSTR(p.p_img,',',1,1)-1),p.p_img) AS p_img, p.p_price, p.p_hit "
			+ "FROM COURSE c, PLACE p WHERE c.c_food = p.p_no AND c.c_no=#{no} ")
	public MyPageCosVO CosDetailFood (int no);		

}