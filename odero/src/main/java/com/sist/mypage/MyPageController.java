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
/*		System.out.println("psize:"+psize);
		System.out.println("size:"+size);
		*/
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
	public String mypage_list(HttpSession session, String sort,  Model model, String page) {
		String m_id = (String)session.getAttribute("m_id");
		if(page==null)
			page="1";
		int curpage = Integer.parseInt(page);
		int rowSize=12;
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		int totalpage=0;
		int block=10;
		int fromPage = ((curpage-1)/block*block)+1;  //보여줄 페이지의 시작
		int toPage = ((curpage-1)/block*block)+block; //보여줄 페이지의 끝
		
		
		
		
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("m_id",m_id);
		
		String jsort=sort;
		if (sort==null)
			jsort = "cos";
		
		/*List<MyPagePlaceVO> list = dao.MyPlaceBest5(m_id);*/ 
		List<MyPageCosVO> plist = dao.MyCosBestPlay(m_id);
		List<MyPagePlaceVO> list = dao.MyPlacePage(map);
/*		List<MyPageCosVO> plist = dao.MyCosBestPlay(m_id);*/
		if (jsort.equals("cos")) {
			model.addAttribute("list",plist);
			totalpage=dao.MyPageCosTotal(m_id);
		}
		if (jsort.equals("place")) {
			model.addAttribute("list",list);
			totalpage=dao.MyPageJJimTotal(m_id);
		}
		if(toPage>totalpage)
			   toPage=totalpage;
		List<MyPageCosVO> clist = dao.MyCosBestCafe(m_id);
		List<MyPageCosVO> flist = dao.MyCosBestFood(m_id);
	
		System.out.println("jsort : " + jsort + "curpage : " + curpage + "totalpage : " + totalpage + " block : " + block + " fromPage : "+ fromPage +"toPage: "  +toPage);
		model.addAttribute("jsort",jsort);
		model.addAttribute("clist",clist);
		model.addAttribute("flist",flist);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage",fromPage);
		model.addAttribute("toPage",toPage);
/*		model.addAttribute("list",list);*/
		return "cart/mypage_list";
	}
	@RequestMapping("mypage_cos.do")
	public String mypage_cos(int no, Model model) {
		
		MyPageCosVO cvo = dao.CosDetailCafe(no);
		MyPageCosVO pvo = dao.CosDetailPlay(no);
		MyPageCosVO fvo = dao.CosDetailFood(no);
		model.addAttribute("cvo",cvo);
		model.addAttribute("pvo",pvo);
		model.addAttribute("fvo",fvo);
		
		return "cart/mypage_cos";
	}
	@RequestMapping("mypage_place.do")
	public String mypage_place() {
		return "cart/mypage_place";
	}
	@RequestMapping("info_modify.do")
	public String info_modfiy (HttpSession session, MyPageInfoVO vo)
	{  // 비밀번호만 변경, 아이디만 변경 나눌떄 사용
		/* String old_pwd = (String)session.getAttribute("m_pwd");*/
		String m_id = (String)session.getAttribute("m_id");
		//닉네임변경
		vo.setM_id(m_id);
		
		dao.nickChange(vo);
		//비밀번호 변경
		if (vo.getM_pwd()!="") 
		dao.pwdChange(vo);
		
		  session.invalidate(); // 세션 클리어 (로그아웃)
		  return "redirect:main.do";
	}
	
	@RequestMapping("place_delete.do")
	public String place_delete (HttpSession session, int no)
	{
		String m_id = (String)session.getAttribute("m_id");
	
		/*dao.placeDelete(m_id, no);*/
		dao.placeDeleteNo(no);
		return "redirect:mypage.do";
	}
	@RequestMapping("cos_delete.do")
	public String cos_delete (HttpSession session, int no)
	{
		String m_id = (String)session.getAttribute("m_id");

		dao.cosDeleteNo(no);
		return "redirect:mypage.do";
	}
	
}
