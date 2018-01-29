package com.sist.course;

import java.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CourseController {
 @RequestMapping("course_search.do")
 public String main_page(String strPosition, Model model) {
  String[] strPositions = new String[9];
  System.out.println("strPosition(controller) : " + strPosition);
  if(strPosition==null){
   strPosition= "";
  } else {
   strPosition = strPosition.substring(0, strPosition.lastIndexOf("_"));
   String[] p_list = strPosition.split("_");
   for(int i=0; i<9; i++) {
    p_list[i] = p_list[i].substring(p_list[i].lastIndexOf("(")+1, p_list[i].lastIndexOf(")"));
    strPositions[i] = p_list[i];
    System.out.println(strPositions[i]);
   }
   System.out.println("strPosition2(controller) : " + strPosition);
  }
  model.addAttribute("strPosition", strPositions);
  return "course/course_search";
 }
 
 //검색버튼 눌렀을 때

  @RequestMapping("course_search_ok.do")
  public String course_search_ok(Model model) {
   //guList : 선택된 구 리스트 , keyList : 선택된 키워드 리스트 
   //         keyList[0] : food, [1] : play, [2] : cafe
   //임의의 데이터 9개
   //랜덤으로 맛집 3, 놀거리 3, 카페 3 뽑기
   
   //랜덤으로 뽑힌 가게 번호 리스트
   //List<Integer> p_noList = new ArrayList<Integer>();

   //주소 리스트로 바꾸기
   List<String> p_addrList = new ArrayList<String>();
   p_addrList.add("서울특별시 강남구 역삼동 620-15번지 2층");
   p_addrList.add("서울 강남구 신사동 517-10 2층");
   p_addrList.add("서울특별시 강남구 역삼동 620-9");
   p_addrList.add("서울 강남구 역삼1동 818-14 크리스탈빌딩 B1");
   p_addrList.add("서울 강남구 역삼동 826-37");
   p_addrList.add("서울시 강남구 역삼동 812-5번지");
   p_addrList.add("서울 강남구 신사동 524-36");
   p_addrList.add("서울 강남구 역삼동 809-3");
   p_addrList.add("서울 강남구 역삼동 718-31");
   
   model.addAttribute("p_addrList", p_addrList);
   return "course/course_search_ok";

  }

}