package com.sist.place;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlaceController {
	@RequestMapping("place.do")
	public String place_page() {
		return "place/place";
	}
	
	@RequestMapping("p_detail.do")
	public String place_detail() {
		return "place/p_detail";
	}
}