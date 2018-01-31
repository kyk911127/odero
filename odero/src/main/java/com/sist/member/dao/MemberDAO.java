package com.sist.member.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.member.dao.MemberMapper;

@Repository
public class MemberDAO {
 @Autowired
 private MemberMapper mapper;
 public int idcheck(String m_id){
  return mapper.idcheck(m_id);
 }
 public void member_join(MemberVO vo){
  mapper.member_join(vo);
 }
 public MemberVO member_login(String m_id){
  return mapper.member_login(m_id);
 }
}