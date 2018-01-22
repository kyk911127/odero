package com.sist.main;

import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sist.main.dao.*;
import com.sist.place.dao.*;
@Controller
public class MainController {
	@Autowired
	private MainDAO dao;
	@RequestMapping("main.do")
	public String main_page(Model model) {
		
		List<PlaceVO> flist = dao.best_food();
		for(PlaceVO vo:flist){
			String img = vo.getP_img();
			
			if(img.equals("-")){
				vo.setP_img("image/no_img.png");
			}else{
				String[] arrImg = img.split(",");
				vo.setP_img(arrImg[0]);
			}
		}
		model.addAttribute("flist", flist);
		return "main";
	}
}
