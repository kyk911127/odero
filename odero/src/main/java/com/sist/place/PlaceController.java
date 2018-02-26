package com.sist.place;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.place.dao.P_ReplyDAO;
import com.sist.place.dao.P_ReplyVO;
import com.sist.place.dao.PlaceDAO;
import com.sist.place.dao.PlaceVO;

@Controller
public class PlaceController {
	@Autowired
	private PlaceDAO dao;
	@Autowired
	private P_ReplyDAO p_dao;
	
	@RequestMapping("p_detail.do")
	public String place_detail(String p_no, Model model) {
/*		if(p_no==null)
			p_no = "2";*/
		dao.placeHit(Integer.parseInt(p_no));
		PlaceVO vo = dao.placeDetailData(Integer.parseInt(p_no));
		vo.setCount(p_dao.p_replyCount(Integer.parseInt(p_no)));
		List<P_ReplyVO> r_list = p_dao.p_replyListData(Integer.parseInt(p_no));
		// keyword split
		String str_kw = vo.getP_keyword();
		String[] skeyword = str_kw.split(",");
		// img split
		String str_img = vo.getP_img();
		String[] simg = str_img.split(",");
		String p_addr = vo.getP_addr();
		
		model.addAttribute("p_addr", p_addr);
		model.addAttribute("backimg", simg[0]);
		model.addAttribute("r_list", r_list);
		model.addAttribute("skeyword", skeyword);
		model.addAttribute("simg", simg);
		model.addAttribute("vo", vo);
		return "place/p_detail";
	}
	
	// reply_insert
	@RequestMapping("p_reply_insert.do")
	public String p_replyInsert(HttpSession session, P_ReplyVO vo) {
		vo.setM_id((String)session.getAttribute("m_id"));
		
		int p_no = vo.getP_no();
		System.out.println(vo.getP_no());
		p_dao.p_replyInsert(vo);
		return "redirect:p_detail.do?p_no=" + p_no;
	}
	
	// reply_update
	@RequestMapping("p_reply_update.do")
	public String p_replyUpdate(P_ReplyVO vo) {
		int p_no = vo.getP_no();
		p_dao.p_replyUpdate(vo);
		return "redirect:p_detail.do?p_no=" + p_no;
	 }
	
	// reply_delete
	@RequestMapping("p_reply_delete.do")
	public String p_replyDelete(HttpSession session, int pr_no, int p_no, Model model) {
		P_ReplyVO vo = new P_ReplyVO();
		vo.setPr_no(pr_no);
		p_dao.p_replyDelete(pr_no);
		model.addAttribute("vo", vo);
		return "redirect:p_detail.do?p_no=" + p_no;
	}
	
	@RequestMapping("p_list.do")
	public String placeListData(HttpSession session,String page, Model model) {
		String m_id=(String)session.getAttribute("m_id");
/*		if(page==null)
			page="1";
		int curpage= Integer.parseInt(page);
		int rowsize=8;
		int start=(rowsize*curpage)-(rowsize-1);
		int end= rowsize * curpage;
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		int totalpage = dao.placeTotalList();
		
		
		
		List<PlaceVO> list =dao.placeListData(map);
		model.addAttribute("list",list);
		model.addAttribute("curpage",curpage);
		model.addAttribute("totalpage",totalpage);*/
		model.addAttribute("m_id",m_id);
		
		return "place/p_list";
	}
	
	
	
}