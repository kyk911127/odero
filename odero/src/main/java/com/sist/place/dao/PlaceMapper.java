package com.sist.place.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import com.sist.mypage.dao.*;

import java.util.*;
/*
 * private int pr_no;
	private String m_id;
	private String pr_msg;
	private Date pr_regdate;
	private int p_no;
 */
public interface PlaceMapper {
	//조회수증가
	@Update("update place "
			+"set p_hit=p_hit+1 "
			+"where p_no=#{p_no}")
	public void placeHit(int p_no);
	
	// 상세조회
	@Select("SELECT p_no, p_name, p_addr, p_price, p_keyword, p_img, p_tel, p_grade, p_time, p_hit "
			+ "FROM place "
			+ "WHERE p_no=#{p_no}")
	public PlaceVO placeDetailData(int p_no);
	 
	// 댓글
	@Select("SELECT p_no, pr_no, m_id, pr_msg, pr_regdate FROM p_reply "
			+ "WHERE p_no=#{pr_no} "
			+ "ORDER BY pr_regdate DESC")
	public List<P_ReplyVO> p_replyListData(int p_no);
	
	// 댓글 추가
	@SelectKey(keyProperty="pr_no", resultType=int.class, before=true, 
				statement="SELECT NVL(MAX(pr_no)+1, 1) as pr_no FROM p_reply")
	@Insert("INSERT INTO p_reply VALUES(#{pr_no}, #{m_id}, #{pr_msg}, SYSDATE, #{p_no})")
	public void p_replyInsert(P_ReplyVO vo);
	
	// 댓글 수정
	@Update("UPDATE p_reply SET pr_msg=#{pr_msg} WHERE pr_no=#{pr_no}")
	public void p_replyUpdate(P_ReplyVO vo);
	
	// 댓글 삭제
	@Delete("DELETE FROM p_reply WHERE pr_no=#{pr_no}")
	public void p_replyDelete(int pr_no);
	
	// 댓글 수
	@Select("SELECT COUNT(*) FROM p_reply WHERE p_no=#{p_no}")
	public int p_replyCount(int p_no);
	
	//맛집,놀거리 list
	@Select("SELECT p_no,p_name,p_addr,p_price,p_keyword,SUBSTR(p_img,0,INSTR(p_img,'/',1,6)) as p_img,num "
			+"FROM (SELECT p_no,p_name,p_addr,p_price,p_keyword,p_img,rownum AS num "
			+"FROM (SELECT p_no,p_name,p_addr,p_price,p_keyword,p_img "
			+"FROM place ORDER BY p_no ASC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<PlaceVO> placeListData(Map map);
			
	//Totalpage
	@Select("SELECT CEIL(COUNT(*)/8) FROM place")
	public int placeTotalList();
		
	//Select list (이색/체험)
	@Select("SELECT p_no,p_grade,p_name,p_addr,NVL(p_price,'정보 없음') as p_price ,NVL(p_keyword,'없음') as p_keyword,SUBSTR(p_img,0,INSTR(p_img,'/',1,6)) as p_img,num "
			+"FROM (SELECT p_no,p_grade,p_name,p_addr,p_price,p_keyword,p_img,rownum AS num "
			+"FROM (SELECT p_no,p_grade,p_name,p_addr,p_price,p_keyword,p_img "
			+"FROM place WHERE p_addr like '%'||#{sn_3}||'%' AND p_grade='p' ORDER BY p_no ASC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<PlaceVO> placeSelectData_p(Map map);
	
	//Select list Totalpage (이색/체험) 
	@Select("SELECT CEIL(COUNT(*)/8) "
			+"FROM (SELECT p_no,p_grade,p_name,p_addr,p_price,p_keyword,p_img,rownum AS num "
			+"FROM (SELECT p_no,p_grade,p_name,p_addr,p_price,p_keyword,p_img "
			+"FROM place WHERE p_addr like '%'||#{sn_3}||'%' AND p_grade='p' ORDER BY p_no ASC))")
	public int placeTotalpage_sp(String sn_3);
	//'%'||#{search_value}||'%'

	//Select list (맛집/카페)
	@Select("SELECT p_no,p_grade,p_name,p_addr,p_price,p_keyword,SUBSTR(p_img,0,INSTR(p_img,'/',1,6)) as p_img,num "
			+"FROM (SELECT p_no,p_grade,p_name,p_addr,p_price,p_keyword,p_img,rownum AS num "
			+"FROM (SELECT p_no,p_grade,p_name,p_addr,p_price,p_keyword,p_img "
			+"FROM place WHERE p_addr like '%'||#{sn_3}||'%' AND p_grade NOT IN( select p_grade from place "
			+"WHERE p_addr like '%'||#{sn_3}||'%' "
			+"AND p_grade = 'p') ORDER BY p_no ASC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<PlaceVO> placeSelectData_cf(Map map);
	
	//Select list Totalpage(맛집/카페)
	@Select("SELECT CEIL(COUNT(*)/8) "
			+"FROM (SELECT p_no,p_grade,p_name,p_addr,p_price,p_keyword,p_img,rownum AS num "
			+"FROM (SELECT p_no,p_grade,p_name,p_addr,p_price,p_keyword,p_img "
			+"FROM place WHERE p_addr like '%'||#{sn_3}||'%' AND p_grade NOT IN( select p_grade from place "
			+"WHERE p_addr like '%'||#{sn_3}||'%' "
			+"AND p_grade = 'p') ORDER BY p_no ASC))")
	public int placeTotalpage_cf(String sn_3);
	
	
	//찜 중복체크
	@Select("SELECT COUNT(*) FROM jjim "
			+"WHERE m_id=#{m_id} AND p_no=#{p_no}")
	public int jjimCount(Map map);
	
	//찜하기
	@Insert("INSERT INTO jjim "
			+"VALUES((SELECT NVL(MAX(j_no)+1,1) FROM jjim),#{m_id},#{p_no})")
	public void jjimInsert(Map map);
	
	//찜정보
	@Select("select p_no from jjim where m_id=#{m_id}")
	public List<MyPageJJimVO> jjimInfo(String m_id);




	
}
