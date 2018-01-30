package com.sist.mypage;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.mypage.dao.*;



@Controller
public class MyPageController {
	@Autowired
	MyPageDAO dao;
	@RequestMapping("mypage.do")
	public String mypage(String m_id, Model model) {
		if (m_id==null)
			m_id = "01059231010"; // 임시로 지정

		List<MyPagePlaceVO> list = dao.MyPlaceBest5(m_id);
		MyPageInfoVO mvo = dao.MyPageInfoData(m_id);
		
		List<MyPageCosVO> clist = dao.MyCosBestCafe(m_id);
		List<MyPageCosVO> plist = dao.MyCosBestPlay(m_id);
		List<MyPageCosVO> flist = dao.MyCosBestFood(m_id);
		int count =clist.size();
		
		
		model.addAttribute("clist",clist);
		model.addAttribute("plist",plist);
		model.addAttribute("flist",flist);
		model.addAttribute("count",count);
		model.addAttribute("list",list);
		model.addAttribute("mvo",mvo);
		return "cart/mypage";
	}
	@RequestMapping("mypage_list.do")
	public String mypage_list(String m_id, Model model) {
		if (m_id==null)
			m_id = "01059231010"; // 임시로 지정
		return "cart/mypage_list";
	}
	@RequestMapping("mypage_cos.do")
	public String mypage_cos() {
		return "cart/mypage_cos";
	}
	@RequestMapping("mypage_place.do")
	public String mypage_place() {
		return "cart/mypage_place";
	}
}
