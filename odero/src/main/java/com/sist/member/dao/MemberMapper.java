package com.sist.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface MemberMapper {
 @Select("SELECT COUNT(*) FROM member WHERE m_id=#{m_id}")
 public int idcheck(String m_id);
 
 @Insert("INSERT INTO member VALUES(#{m_id},#{m_pwd},#{m_name})")
 public void member_join(MemberVO vo);

 @Select("SELECT * FROM member WHERE m_id=#{m_id}")
 public MemberVO member_login(String m_id);
}
