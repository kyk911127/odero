package com.sist.place;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlaceController {
	@RequestMapping("p_list.do")
	public String place_page() {
		return "place/p_list";
	}
	
	@RequestMapping("p_detail.do")
	public String place_detail() {
		return "place/p_detail";
	}
}