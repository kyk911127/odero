package com.sist.place;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.*;
import com.sist.place.dao.*;

@Controller
public class PlaceController {
	
	@Autowired
	private PlaceDAO dao;
	
	
	@RequestMapping("p_detail.do")
	public String place_detail(int p_no, Model model) {
		
		String[] timg={"p_image/top.jpg","p_image/top1.jpg",  "p_image/top2.jpg","p_image/top3.jpg"};
		PlaceVO vo = dao.placeDetailData(p_no);
		
		model.addAttribute("timg",timg);
		model.addAttribute("vo", vo);
		return "place/p_detail";
	}
	

	@RequestMapping("p_list.do")
	public String placeListData(String page, Model model) {
		
		if(page==null)
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
		model.addAttribute("totalpage",totalpage);
		
		
		
		return "place/p_list";
	}
	
	@RequestMapping("select.do")
	public String select(SelectVO vo, String play, String food, Model model)
	{
		System.out.println(play);
		System.out.println(food);
		return"place/select";
	}
}