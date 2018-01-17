package com.sist.course;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CourseController {
	@RequestMapping("course_search.do")
	public String main_page() {
		return "course/course_search";
	}
}
