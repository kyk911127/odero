package com.sist.course;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.course.dao.CourseDAO;
import com.sist.place.dao.PlaceVO;

@Controller
public class CourseController {
	@Autowired
	private CourseDAO dao;
	
	@RequestMapping("course_search.do")
	public String main_page(String strPosition, String strPno, Model model) {
		String[] strPositions = new String[9];
		String[] strPnos = new String[9];
		System.out.println("strPosition(controller) : " + strPosition);
		System.out.println("strPno(controller) : " + strPno);
		if (strPosition == null || strPno == null) {
			strPosition = "";
			strPno = "";
		} else {
			strPosition = strPosition.substring(0, strPosition.lastIndexOf("_"));
			strPno = strPno.substring(0, strPno.lastIndexOf("_"));
			
			String[] pc_list = strPosition.split("_");
			String[] pno_list = strPno.split("_");
			for (int i = 0; i < 9; i++) {
				pc_list[i] = pc_list[i].substring(pc_list[i].lastIndexOf("(") + 1, pc_list[i].lastIndexOf(")"));
				strPositions[i] = pc_list[i];
				strPnos[i] = pno_list[i];
				System.out.println(strPositions[i]);
			}
			
			System.out.println("strPosition2(controller) : " + strPosition);
		}
		model.addAttribute("strPosition", strPositions);
		model.addAttribute("strPnos", strPnos);
		return "course/course_search";
	}

	// 검색버튼 눌렀을 때

	@RequestMapping("course_search_ok.do")
  public String course_search_ok(Model model) {
   //guList : 선택된 구 리스트 , keyList : 선택된 키워드 리스트 
   //         keyList[0] : food, [1] : play, [2] : cafe
   //임의의 데이터 9개
   int[] no_list = {4307,4299,4320,4483,4515,4599,4553,4577,4610};
   
   List<PlaceVO> p_list = new ArrayList<PlaceVO>();
   for(int i=0; i<9; i++) {
	   PlaceVO vo = dao.course_place_data(no_list[i]);
	   System.out.println("======================");
	   System.out.println("가게번호 : " + vo.getP_no());
	   System.out.println("가게이름 : " + vo.getP_name());
	   System.out.println("가게유형 : " + vo.getP_grade());
	   System.out.println("가게주소 : " + vo.getP_addr());
	   System.out.println("조회수 : " + vo.getP_hit());
	   System.out.println("======================");
	   p_list.add(vo);
   }
   //랜덤으로 맛집 3, 놀거리 3, 카페 3 뽑기
   
   //랜덤으로 뽑힌 가게 번호 리스트
   //List<Integer> p_noList = new ArrayList<Integer>();

   model.addAttribute("p_list", p_list);
   return "course/course_search_ok";

  }

}