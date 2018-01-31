package com.sist.course;

import java.util.*;

import org.apache.ibatis.annotations.Insert;
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
		List<PlaceVO> p_list = new ArrayList<PlaceVO>();
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

			// pno_list에 있는 가게번호로 가게 정보 넘기기
			for (String no : pno_list) {
				PlaceVO vo = dao.course_place_data(Integer.parseInt(no));
				p_list.add(vo);
			}

			System.out.println("strPosition2(controller) : " + strPosition);
		}

		model.addAttribute("p_list", p_list);
		model.addAttribute("strPosition", strPositions);
		model.addAttribute("strPnos", strPnos);
		return "course/course_search";
	}

	// 검색버튼 눌렀을 때

	@RequestMapping("course_search_ok.do")
	public String course_search_ok(String gulist, String keylist_f, String keylist_c, String keylist_p, Model model) {
		// gulist : 선택된 구 리스트 , keylist_ : 선택된 키워드 리스트
		System.out.println("gulist : " + gulist);
		System.out.println("keylist_f : " + keylist_f);
		System.out.println("keylist_c : " + keylist_c);
		System.out.println("keylist_p : " + keylist_p);
		// 임의의 데이터 9개
		int[] no_list = { 4307, 4299, 4320, 4483, 4515, 4599, 4553, 4577, 4610 };

		List<PlaceVO> p_list = new ArrayList<PlaceVO>();
		for (int i = 0; i < 9; i++) {
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
		// 랜덤으로 맛집 3, 놀거리 3, 카페 3 뽑기

		// 랜덤으로 뽑힌 가게 번호 리스트
		// List<Integer> p_noList = new ArrayList<Integer>();

		model.addAttribute("p_list", p_list);
		return "course/course_search_ok";

	}

	@RequestMapping("placetoplace.do")
	public String place_to_place(int p_no, int cnt, Model model) {
		PlaceVO vo = dao.course_place_data(p_no);
		System.out.println("p_no : " + p_no);
		System.out.println("cnt : " + cnt);
		System.out.println("vo.getP_name() : " + vo.getP_name());
		model.addAttribute("vo", vo);
		return "course/place_view/place_" + cnt;
	}

	@RequestMapping("getkeyword.do")
	public String get_keyword(String gulist, String key, Model model) {
		System.out.println("gulist : " + gulist);
		// 서대문구|마포구
		/*
		 * //맛집테이블에 키워드 넣기
		 * 
		 * @Insert("INSERT INTO sfood VALUSE(#{sf_key}, #{sf_grade})") public
		 * void sfood_insert(String sf_key, String sf_grade);
		 */
		// 키워드 테이블 비우기
		dao.sfood_delete();

		Map map = new HashMap();

		// 키워드 split하기
		map.put("p_grade", key);
		map.put("gulist", gulist);
		List<String> fk_list = dao.course_fkeyword(map);

		for (String s : fk_list) {
			if (s != null && !(s.equals(""))) {
				String[] arrfkey = s.split("[,]");
				for (int i = 0; i < arrfkey.length; i++) {
					if (arrfkey[i] != null && !(arrfkey[i].equals(""))) {
						Map in_map = new HashMap();
						System.out.println(arrfkey[i]);
						in_map.put("sf_key", arrfkey[i]);
						in_map.put("sf_grade", key);
						dao.sfood_insert(in_map);
					}
				}
			}
		}
		List<String> key_list = dao.sfood_distinct(key);

		model.addAttribute("key_list", key_list);
		model.addAttribute("key", key);

		return "course/place_view/keyword_" + key;
	}

}