package com.sist.place;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlaceController {
	@RequestMapping("p_list.do")
	public String place_page() {
		return "place/p_list";
	}
	
	@RequestMapping("p_detail.do")
	public String place_detail(Model model) {
		
		String[] timg={"p_image/top.jpg","p_image/top1.jpg",  "p_image/top2.jpg","p_image/top3.jpg"};
		
		model.addAttribute("timg",timg);
		
		return "place/p_detail";
	}
}