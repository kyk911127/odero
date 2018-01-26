package com.sist.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
/*
 * private int r_no;
	private String m_id;     
	private String r_subject;
	private String r_pname;  
	private String r_content;
	private String r_hit;    
	private Date r_reddate;  
	private String r_imgname;
	private int r_imgcount;  
 */
public interface ReviewMapper {
	//List
	@Select("SELECT r_no,m_id,r_subject,r_pname,r_addr,r_hit,r_regdate,r_imgname,num "
		  + "FROM (SELECT r_no,m_id,r_subject,r_pname,r_addr,r_hit,r_regdate,r_imgname,rownum AS num "
		  + "FROM (SELECT r_no,m_id,r_subject,r_pname,r_addr,r_hit,r_regdate,r_imgname "
		  + "FROM review ORDER BY r_no DESC)) "
		  + "WHERE num BETWEEN #{start} AND #{end}")
	public List<ReviewVo> reviewList(Map map);
	
	//TotalPage
	@Select("SELECT CEIL(COUNT(*)/9) FROM review")
	public int reviewTotalList();
		
	//Insert
	@SelectKey(keyProperty="r_no", resultType=int.class, before=true, 
			statement="SELECT NVL(MAX(r_no)+1,1) AS no FROM review")
	@Insert("INSERT INTO review VALUES(#{r_no},#{m_id},#{r_subject},#{r_pname},#{r_content},0,SYSDATE,"
		  + "#{r_imgname},#{r_imgcount},#{r_addr})")
	public void reviewInsert(ReviewVo vo);
	
	@Update("UPDATE review SET r_hit=r_hit+1 WHERE r_no=#{r_no}")
	public void reviewHitIncrement(int no);
	@Select("SELECT r_no,m_id,r_subject,r_pname,r_addr,r_hit,r_regdate,r_imgname,r_imgcount FROM review WHERE r_no=#{r_no}")
	public ReviewVo reviewDetail(int no); 
}
