package com.sist.cart;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class CartController {
	@RequestMapping("mypage.do")
	public String main_page() {
		return "cart/mypage";
	}
}
