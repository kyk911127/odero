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
		String[] f_Positions = new String[3];
		String[] c_Positions = new String[3];
		String[] p_Positions = new String[3];
		String[] strPnos = new String[9];
		String[] f_Pnos = new String[3];
		String[] c_Pnos = new String[3];
		String[] p_Pnos = new String[3];
		List<PlaceVO> pf_list = new ArrayList<PlaceVO>();
		List<PlaceVO> ppc_list = new ArrayList<PlaceVO>();
		List<PlaceVO> pp_list = new ArrayList<PlaceVO>();
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
				String img = vo.getP_img().split(",")[0];
				if(img.equals("-")){
					continue;
				}else{
					vo.setP_img(img);
				}
				p_list.add(vo);
				String time = vo.getP_time();
				if(time == null) {
					vo.setP_time("시간 정보 없음");
				}
			}
			int f = 0;
			int c = 0;
			int p = 0;
			for(int i=0; i<9; i++) {
				if(p_list.get(i).getP_grade().equals("f")) {
					pf_list.add(p_list.get(i));
					f_Positions[f] = strPositions[i];
					f_Pnos[f] = strPnos[i];
					f++;
				} else if(p_list.get(i).getP_grade().equals("c")) {
					ppc_list.add(p_list.get(i));
					c_Positions[c] = strPositions[i];
					c_Pnos[c] = strPnos[i];
					c++;
				} else {
					pp_list.add(p_list.get(i));
					p_Positions[p] = strPositions[i];
					p_Pnos[p] = strPnos[i];
					p++;
				}
			}

			System.out.println("strPosition2(controller) : " + strPosition);
		}

		model.addAttribute("pf_list", pf_list);
		model.addAttribute("ppc_list", ppc_list);
		model.addAttribute("pp_list", pp_list);
		model.addAttribute("p_list", p_list);
		model.addAttribute("strPosition", strPositions);
		model.addAttribute("f_Positions", f_Positions);
		model.addAttribute("c_Positions", c_Positions);
		model.addAttribute("p_Positions", p_Positions);
		model.addAttribute("f_Pnos", f_Pnos);
		model.addAttribute("c_Pnos", c_Pnos);
		model.addAttribute("p_Pnos", p_Pnos);
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
		
		//랜덤으로 가게 번호 뽑기
		// 1. 가게 리스트 가져오기
		Map map = new HashMap();
			//food
		map.put("p_grade", "f");
		map.put("gulist", gulist);
		map.put("keylist", keylist_f);
		System.out.println("11111111111111");
		List<PlaceVO> fvo_list = dao.getPlaceInfo(map);
		System.out.println("2222222222222222222");
			//cafe
		map.put("p_grade", "c");
		map.put("keylist", keylist_c);
		List<PlaceVO> cvo_list = dao.getPlaceInfo(map);
			//play
		map.put("p_grade", "p");
		map.put("keylist", keylist_p);
		List<PlaceVO> pvo_list = dao.getPlaceInfo(map);
		// 2. 유형별 리스트에서 랜덤으로 3개 고르기(중복제거)
		int[] fno_list = new int[3];
		int[] cno_list = new int[3];
		int[] pno_list = new int[3];
		int j = 0;
		while(j<3) {
			boolean ck = false;
			int rand = (int)(Math.random()*fvo_list.size());
			for(int i=0; i<3; i++) {
				if(fno_list[i] == rand)
					ck = true;
			}
			if(ck==false) {
				fno_list[j] = rand;
				j++;
			}
		}
		j = 0;
		while(j<3) {
			boolean ck = false;
			int rand = (int)(Math.random()*cvo_list.size());
			for(int i=0; i<3; i++) {
				if(cno_list[i] == rand)
					ck = true;
			}
			if(ck==false) {
				cno_list[j] = rand;
				j++;
			}
		}
		j = 0;
		while(j<3) {
			boolean ck = false;
			int rand = (int)(Math.random()*pvo_list.size());
			for(int i=0; i<3; i++) {
				if(pno_list[i] == rand)
					ck = true;
			}
			if(ck==false) {
				pno_list[j] = rand;
				j++;
			}
		}
		System.out.println(fno_list[0] + " / " + fno_list[1] + " / " + fno_list[2]);
		System.out.println(cno_list[0] + " / " + cno_list[1] + " / " + cno_list[2]);
		System.out.println(pno_list[0] + " / " + pno_list[1] + " / " + pno_list[2]);
		
		// 임의의 데이터 9개
		int[] no_list = { fvo_list.get(fno_list[0]).getP_no(), 
				fvo_list.get(fno_list[1]).getP_no(), 
				fvo_list.get(fno_list[2]).getP_no(), 
				cvo_list.get(cno_list[0]).getP_no(), 
				cvo_list.get(cno_list[1]).getP_no(), 
				cvo_list.get(cno_list[2]).getP_no(), 
				pvo_list.get(pno_list[0]).getP_no(), 
				pvo_list.get(pno_list[1]).getP_no(), 
				pvo_list.get(pno_list[2]).getP_no() };

		List<PlaceVO> p_list = new ArrayList<PlaceVO>();
		for (int i = 0; i < 9; i++) {
			PlaceVO vo = dao.course_place_data(no_list[i]);
			System.out.println("======================");
			System.out.println("가게번호 : " + vo.getP_no());
			System.out.println("가게이름 : " + vo.getP_name());
			System.out.println("가게유형 : " + vo.getP_grade());
			System.out.println("가게주소 : " + vo.getP_addr());
			System.out.println("조회수 : " + vo.getP_hit());
			System.out.println("time : " + vo.getP_time());
			System.out.println("======================");
			p_list.add(vo);
		}

		model.addAttribute("p_list", p_list);
		return "course/course_search_ok";

	}

	@RequestMapping("placetoplace.do")
	public String place_to_place(int p_no, int cnt, boolean placeCheck, Model model) {
		PlaceVO vo = dao.course_place_data(p_no);
		/*System.out.println("p_no : " + p_no);
		System.out.println("cnt : " + cnt);
		System.out.println("vo.getP_name() : " + vo.getP_name());*/
		model.addAttribute("placeCheck", placeCheck);
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
						/*System.out.println(arrfkey[i]);*/
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