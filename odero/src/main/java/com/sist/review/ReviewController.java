package com.sist.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	@RequestMapping("review_list.do")
	public String main_page() {
		return "review/list";
	}
}
