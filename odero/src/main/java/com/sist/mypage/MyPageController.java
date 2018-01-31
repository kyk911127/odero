package com.sist.mypage;

import java.util.*;

import javax.servlet.http.HttpSession;

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
	public String mypage(HttpSession session, Model model) {
		String m_id = (String)session.getAttribute("m_id");
		/*if (m_id==null)
			m_id = "01059231010"; // 임시로 지정
		 */
		List<MyPagePlaceVO> list = dao.MyPlaceBest5(m_id);
		MyPageInfoVO mvo = dao.MyPageInfoData(m_id);
		
		List<MyPageCosVO> clist = dao.MyCosBestCafe(m_id);
		List<MyPageCosVO> plist = dao.MyCosBestPlay(m_id);
		List<MyPageCosVO> flist = dao.MyCosBestFood(m_id);
		int count =clist.size();
		int psize = plist.size();
		int size = list.size();
		System.out.println("psize:"+psize);
		System.out.println("size:"+size);
		
		model.addAttribute("psize",psize);
		model.addAttribute("size",size);
		model.addAttribute("clist",clist);
		model.addAttribute("plist",plist);
		model.addAttribute("flist",flist);
		model.addAttribute("count",count);
		model.addAttribute("list",list);
		model.addAttribute("mvo",mvo);
		return "cart/mypage";
	}
	@RequestMapping("mypage_list.do")
	public String mypage_list(HttpSession session, String sort,  Model model) {
		String m_id = (String)session.getAttribute("m_id");
		
		String jsort=sort;
		if (sort==null)
			jsort = "cos";
		
		
		List<MyPagePlaceVO> list = dao.MyPlaceBest5(m_id);
		List<MyPageCosVO> plist = dao.MyCosBestPlay(m_id);
		
		
		if (jsort.equals("cos")) {
			model.addAttribute("list",plist);
			
		}
		if (jsort.equals("place")) {
			model.addAttribute("list",list);
		}

		List<MyPageCosVO> clist = dao.MyCosBestCafe(m_id);
		List<MyPageCosVO> flist = dao.MyCosBestFood(m_id);
	

		model.addAttribute("jsort",jsort);
		model.addAttribute("clist",clist);
		model.addAttribute("flist",flist);
/*		model.addAttribute("list",list);*/
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
