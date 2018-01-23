package com.sist.masterBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.masterBoard.dao.MasterBoardDAO;
import com.sist.masterBoard.dao.NoticeVO;

@Controller
public class MasterBoardController {
	@Autowired
	private MasterBoardDAO dao;


	@RequestMapping("MasterBoard.do")
	public String MasterBoardList(String page, Model model){
		if(page==null) page = "1";

		int curpage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;

		Map map = new HashMap();

		map.put("start", start);
		map.put("end", end);

		List<NoticeVO> list = dao.MasterBoardList(map);
		int totalpage = dao.MasterBoardToltalPage();

		
		model.addAttribute("list",list);
		model.addAttribute("curpage",curpage);
		model.addAttribute("totalpage",totalpage);

		return "masterBoard/list";
	}
	
	@RequestMapping("MasterBoardInsert.do")
	public String MasterBoardInsert(){
		return "masterBoard/insert";
	}
	
	@RequestMapping("MasterBoardInsert_ok.do")
	public String MasterBoardInsert_ok(NoticeVO vo){
		dao.MasterBoardInsert(vo);
		return "redirect:MasterBoard.do";
	}
	
	
	@RequestMapping("MasterBoardContent.do")
	public String MasterBoardContent(int no,Model model){
		NoticeVO vo = dao.MasterBoardContent(no);
		
		
		model.addAttribute("vo",vo);
		
		return "masterBoard/content";
	}
	
	

	@RequestMapping("MasterBoardUpdate.do")
	public String MasterBoardUpdate(int no,Model model)
	{
		NoticeVO vo=dao.MasterBoardContent(no);
		model.addAttribute("vo", vo);
		return "masterBoard/update";
	}
	


	@RequestMapping("MasterBoardDelete.do")
	public String MasterBoardDelete(int no,Model model)
	{
		model.addAttribute("no", no);
		return "masterBoard/delete";
	}


}
