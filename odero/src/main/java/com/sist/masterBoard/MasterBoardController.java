package com.sist.masterBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.masterBoard.dao.MasterBoardDAO;
import com.sist.masterBoard.dao.NoticeVO;
import com.sist.masterBoard.dao.ReplyVO;

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
		int count = dao.MasterBoardRowCount();
		count = count-((curpage*10)-10);


		model.addAttribute("list",list);
		model.addAttribute("curpage",curpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("count",count);

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

	@RequestMapping("MasterBoardReply.do")
	public String MasterBoardReply(int page,int no,Model model){
		model.addAttribute("page",page);
		model.addAttribute("no",no);
		return "masterBoard/reply";
	}

	@RequestMapping("MasterBoardReply_ok.do")
	public String MasterBoardReply_ok(NoticeVO vo,int page){
		dao.MasterBoardReplyInsert(vo);
		return "redirect:MasterBoard.do?page="+page;
	}


	@RequestMapping("MasterBoardContent.do")
	public String MasterBoardContent(int no,int page,Model model){
		NoticeVO vo = dao.MasterBoardContent(no);


		int curpage=page;
		int rowSize=10;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=(curpage*rowSize);

		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("bno", no);
		List<ReplyVO> list=dao.replyListData(map);

		model.addAttribute("vo",vo);
		model.addAttribute("page",page);
		model.addAttribute("list", list);
 
		return "masterBoard/content";
	}



	@RequestMapping("MasterBoardUpdate.do")
	public String MasterBoardUpdate(int no,int page,Model model)
	{
		NoticeVO vo=dao.MasterBoardContent(no);
		model.addAttribute("vo", vo);
		model.addAttribute("page",page);

		return "masterBoard/update";
	}


	@RequestMapping("MasterBoardUpdate_ok.do")
	public String update_ok(NoticeVO vo,int page,Model model){
		boolean bCheck=dao.MasterBoardUpdate_ok(vo);
		model.addAttribute("page",page);
		model.addAttribute("no",vo.getNo());
		model.addAttribute("page",page);
		model.addAttribute("bCheck",bCheck);

		return "masterBoard/update_ok";
	}


	@RequestMapping("MasterBoardDelete.do")
	public String MasterBoardDelete(int no,Model model)	{
		model.addAttribute("no", no);
		return "masterBoard/delete";
	}


	@RequestMapping("MasterBoardDelete_ok.do")
	public String board_delete_ok(int no,String pwd,Model model){
		boolean bCheck=dao.MasterBoardDelete_ok(no, pwd);
		model.addAttribute("bCheck",bCheck);
		return "masterBoard/delete_ok";
	}



	@RequestMapping("reply_new_insert.do")
	public String reply_new_insert(int bno,String msg,String name,Model model) {
		ReplyVO vo=new ReplyVO();
		Map map = new HashMap();
		map.put("bno", bno);
		map.put("msg", msg);
		map.put("name", name);

		dao.replyNewInsert(map);

		model.addAttribute("no", bno);
		return "masterBoard/content.do?no="+bno;
	}

	@RequestMapping("reply_reply_insert.do")
	public String reply_reply_insert(int bno,int pno,String msg,String name){
		ReplyVO pvo=dao.replyGetParentInfo(pno);

		ReplyVO vo=new ReplyVO();
		vo.setBno(bno);
		vo.setName(name);
		vo.setMsg(msg);
		vo.setGroup_id(pvo.getGroup_id());
		vo.setGroup_step(pvo.getGroup_step());
		vo.setGroup_tab(pvo.getGroup_tab());
		vo.setRoot(pno);

		// step증가
		dao.replyStepIncrement(pvo);
		// insert
		dao.replyRepyInsert(vo);
		// depth증가
		dao.replyDepthIncrement(pno);
		// 전송 
		//req.setAttribute("bno", bno);
		return "content.do?no="+bno;
	}

/*
	@RequestMapping("reply_update.do")
	public String reply_update( HttpServletResponse res)
	{
		try
		{
			req.setCharacterEncoding("EUC-KR");
		}catch(Exception ex){}
		String bno=req.getParameter("bno");
		String no=req.getParameter("no");
		String msg=req.getParameter("msg");
		ReplyVO vo=new ReplyVO();
		vo.setNo(Integer.parseInt(no));
		vo.setMsg(msg);
		// DB연동
		BoardDAO.replyUpdate(vo);
		return "content.do?no="+bno;
	}*/

}
























