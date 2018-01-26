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
		//가성비 코스
		String[] gu = {"강서구", "구로구", "양천구", "금천구", "영등포구", "관악구", "동작구", "서초구", "강남구", "송파구", "강동구", "마포구", "서대문구",
				"은평구", "용산구", "중구", "종로구", "성동구", "동대문구", "성북구", "광진구", "중랑구", "노원구", "강북구", "도봉구" };
		int arrRandom[] = {};
		for(int i =0; i<4; i++){
			int random = (int)(Math.random()*gu.length);
			arrRandom[i] = random;
			for(int j=0; j<i; j++){
				if(arrRandom[i]==arrRandom[j]){
					i--;
					break;
				}
			}
		}
		List<List<PlaceVO>> clist = new ArrayList<List<PlaceVO>>();
		for(int i=0;i<4;i++){
			List<PlaceVO> c_detail_list = new ArrayList<PlaceVO>();
			List<List<PlaceVO>> tmplist = new ArrayList<List<PlaceVO>>();
			tmplist.add(dao.best_course("f", gu[arrRandom[i]]));
			tmplist.add(dao.best_course("d", gu[arrRandom[i]]));
			tmplist.add(dao.best_course("p", gu[arrRandom[i]]));
			
			for(int j=0;j<3;j++){
				int rd = (int)(Math.random()*tmplist.get(j).size());
				c_detail_list.add(tmplist.get(j).get(rd));
			}
			clist.add(c_detail_list);
		}
		
		
		//best food
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
		//best play
		List<PlaceVO> plist = dao.best_play();
		for(PlaceVO vo:plist){
			String img = vo.getP_img();
			
			if(img.equals("-")){
				vo.setP_img("image/no_img.png");
			}else{
				String[] arrImg = img.split(",");
				vo.setP_img(arrImg[0]);
			}
		}
		
		model.addAttribute("clist", clist);//course 리스트
		model.addAttribute("flist", flist);//best food
		model.addAttribute("plist", plist);//best play
		return "main";
	}
}
