package com.sist.member;

import javax.servlet.http.HttpSession;

import org.apache.flume.source.SyslogUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.member.dao.MemberDAO;
import com.sist.member.dao.MemberVO;
@Controller
public class MemberController {
 @Autowired
 private MemberDAO dao;
 
 @RequestMapping("idCheck.do")
 public String idCheck(String id,Model model){
  int idcount = dao.idcheck(id);
  model.addAttribute("idcount", idcount);
  return "member/member_check/join_check";
 }
 @RequestMapping("join.do")
 public String join(MemberVO vo){
  dao.member_join(vo);
  return "member/join_ok";
 }
 @RequestMapping("login_ok.do")
 public String login_ok(MemberVO vo, Model model, HttpSession session){
  int cnt = dao.idcheck(vo.getM_id());
  if (cnt==0) {
   model.addAttribute("count", cnt);//id없을 때
   return "member/member_check/login_check";
  } else {
   MemberVO dbvo = dao.member_login(vo.getM_id());
   if (dbvo.getM_pwd().equals(vo.getM_pwd())) { //비번 일치->로그인 성공
    
    model.addAttribute("count", 1);
    session.setAttribute("m_id", dbvo.getM_id());
    session.setAttribute("m_pwd", dbvo.getM_pwd());
    session.setAttribute("m_name", dbvo.getM_name());
    
    return "member/member_check/login_check";
   } else { //비밀번호 불일치
    
    model.addAttribute("count", 2);
    return "member/member_check/login_check";
   }
  }
 }
 
 @RequestMapping("logout.do")
 public String logout(HttpSession session){
  session.invalidate();
  
  return "redirect:main.do";
 }
}