package com.sist.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
/*
 * private int r_no;
	private String m_id;     아이디
	private String r_subject;제목
	private String r_pname;  가게명
	private String r_content;내용
	private String r_hit;    조회수
	private Date r_reddate;  등록날짜
	private String r_imgname;이미지이름
	private int r_imgcount;  이미지여부
 */
public interface ReviewMapper {
	//List
	@Select("SELECT r_no,m_id,r_subject,r_pname,r_hit,r_regdate,r_imgname,num "
		  + "FROM (SELECT r_no,m_id,r_subject,r_pname,r_hit,r_regdate,r_imgname,rownum AS num "
		  + "FROM (SELECT r_no,m_id,r_subject,r_pname,r_hit,r_regdate,r_imgname "
		  + "FROM review ORDER BY r_no DESC)) "
		  + "WHERE num BETWEEN #{start} AND #{end}")
	public List<ReviewVo> reviewList(Map map);
	
	//TotalPage
	@Select("SELECT COUNT(*) FROM review")
	public int reviewTotalList();
		
	//Insert
	@SelectKey(keyProperty="r_no", resultType=int.class, before=true, 
			statement="SELECT NVL(MAX(r_no)+1,1) AS no FROM review")
	@Insert("INSERT INTO review VALUES(r_no,r_subject=#{r_subject},r_pname=#{r_pname},r_content=#{r_content},0,SYSDATE,"
		  + "r_imgname=#{r_imgname},r_imgcount=#{r_imgcount})")
	public void reviewInsert(ReviewVo vo);
}
