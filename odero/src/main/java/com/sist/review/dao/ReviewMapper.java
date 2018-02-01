package com.sist.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
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
	@Select("SELECT r_no,m_id,r_subject,r_pname,r_content,r_addr,r_hit,r_regdate,r_imgname,r_imgcount FROM review WHERE r_no=#{r_no}")
	public ReviewVo reviewDetail(int no); 
	
	@Select("SELECT m_id,r_imgname,r_imgcount FROM review WHERE r_no=#{r_no}")
	public ReviewVo reviewDeleteData(int no);
	
	@Update("UPDATE review SET r_subject=#{r_subject},r_pname=#{r_pname},r_content=#{r_content},r_addr=#{r_addr} WHERE r_no=#{r_no}")
	public void reviewUpdateData(ReviewVo vo);
	
	@Delete("DELETE FROM review WHERE r_no=#{r_no}")
	public void reviewDelete(int no);
	/*
		rr_no
		r_no
		m_id
		rr_msg
		rr_regdate
		rr_gid
		rr_gstep
		rr_gtab
		rr_depth
		rr_root
	 */
	
	// reply
	@SelectKey(keyProperty="rr_no", resultType=int.class, before=true, 
			statement="SELECT NVL(MAX(rr_no)+1,1) AS no FROM review_reply")
	@Insert("INSERT INTO review_reply(rr_no,r_no,m_id,rr_msg,rr_gid) "
			+ "VALUES(#{rr_no},#{r_no},#{m_id},#{rr_msg},(SELECT NVL(MAX(rr_gid)+1,1) FROM review_reply))")
	public void replyInsert(Review_ReplyVo vo);
	
	@Select("SELECT rr_no,m_id,rr_msg,rr_regdate,rr_gid,rr_gstep,rr_gtab,rr_depth,rr_root,num "
			+ "FROM (SELECT rr_no,m_id,rr_msg,rr_regdate,rr_gid,rr_gstep,rr_gtab,rr_depth,rr_root,rownum AS num "
			+ "FROM (SELECT rr_no,m_id,rr_msg,rr_regdate,rr_gid,rr_gstep,rr_gtab,rr_depth,rr_root "
			+ "FROM review_reply WHERE r_no=(SELECT r_no FROM review WHERE r_no=#{no}) "
			+ "ORDER BY rr_gid DESC, rr_gstep ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<Review_ReplyVo> replyList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10) FROM review_reply WHERE r_no=#{r_no} AND rr_root=0")
	public int replyTotalList(int no);
	
	@Delete("DELETE FROM review_reply WHERE rr_no=#{rr_no}")
	public void replyDelete(int no);
	
	//  대댓글
	// insert
	@Select("SELECT rr_gid,rr_gstep,rr_gtab FROM review_reply WHERE rr_no=#{rr_no}")
	public Review_ReplyVo re_replyParent(int no);
	@Update("UPDATE review_reply SET rr_gstep = rr_gstep+1 WHERE rr_gid=#{rr_gid} AND rr_gstep > #{rr_gstep}")
	public void re_replySort(Review_ReplyVo vo);
	
	@SelectKey(keyProperty="rr_no", resultType=int.class, before=true, 
			statement="SELECT NVL(MAX(rr_no)+1,1) AS no FROM review_reply")
	@Insert("INSERT INTO review_reply "
			+ "VALUES(#{rr_no},#{r_no},#{m_id},#{rr_msg},SYSDATE,#{rr_gid},#{rr_gstep},#{rr_gtab},#{rr_no},0)")
	public void re_replyInsert(Review_ReplyVo vo);
	
	
}
