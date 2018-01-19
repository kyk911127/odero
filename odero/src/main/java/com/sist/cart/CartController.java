package com.sist.cart;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class CartController {
	@RequestMapping("mypage.do")
	public String mypage() {
		return "cart/mypage";
	}
	@RequestMapping("mypage_list.do")
	public String mypage_list() {
		return "cart/mypage_list";
	}
	@RequestMapping("mypage_cos.do")
	public String mypage_cos() {
		return "cart/mypage_cos";
	}
	@RequestMapping("mypage_place.do")
	public String mypage_place() {
		return "cart/mypage_place";
	}
}
