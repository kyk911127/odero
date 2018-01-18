package com.sist.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.review.dao.ReviewDao;
import com.sist.review.dao.ReviewVo;

@Controller
public class ReviewController {
	@Autowired
	private ReviewDao dao;
	@RequestMapping("review_list.do")
	public String reviewList(String page, Model model) {
		System.out.println("dd");
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		System.out.println(curpage);
		int rowSize = 9;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;

		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		List<ReviewVo> list = dao.reviewList(map);
		model.addAttribute("list", list);

		int totalpage = dao.reviewTotalList();
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);

		return "review/list";
	}
	
	@RequestMapping("review_insert")
	public String reviewInsertPage() {
		return "review/insert";
	}
	
	@RequestMapping("review_insert_ok")
	public String reviewInsert(ReviewVo vo){
		
		return "review/list";
	}
}
