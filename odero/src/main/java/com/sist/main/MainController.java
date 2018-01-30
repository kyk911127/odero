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
				int arrRandom[] = {33,33,33,33};
				List<String> gulist = new ArrayList<String>();
				List<String> guimg = new ArrayList<String>();
				for(int i =0; i<4; i++){
					int random = (int)(Math.random()*gu.length);
					arrRandom[i] = random;
					for(int j=0; j<i; j++){
						if(arrRandom[i]==arrRandom[j]){
							i--;
							break;
						}
					}
					System.out.println("random "+i+": "+ arrRandom[i]);
				}
				List<List<PlaceVO>> clist = new ArrayList<List<PlaceVO>>();
				List<Integer> totallist = new ArrayList<Integer>();
				for(int i=0;i<4;i++){
					List<PlaceVO> c_detail_list = new ArrayList<PlaceVO>();
					List<List<PlaceVO>> tmplist = new ArrayList<List<PlaceVO>>();
					gulist.add(gu[arrRandom[i]]);
					Map map = new HashMap();
					map.put("gu", gu[arrRandom[i]]);
					map.put("p_grade", "f");
					tmplist.add(dao.best_course(map));
					map.put("p_grade", "c");
					tmplist.add(dao.best_course(map));
					map.put("p_grade", "p");
					tmplist.add(dao.best_course(map));
					int totalprice =0;
					for(int j=0;j<3;j++){
						int rd = (int)(Math.random()*tmplist.get(j).size());
						PlaceVO tmpvo = tmplist.get(j).get(rd);
						String img = tmpvo.getP_img().split(",")[0];
						if(img.equals("-")){
							continue;
						}else{
							tmpvo.setP_img(img);
						}
						int price = Integer.parseInt(tmpvo.getP_price().substring(0, 1));
						totalprice+=price;
						c_detail_list.add(tmpvo);
						System.out.println(tmplist.get(j).get(rd).getP_name());
					}
					guimg.add(c_detail_list.get(1).getP_img());
					totallist.add(totalprice);
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
				
				model.addAttribute("guimg", guimg); //course 각 이미지
				model.addAttribute("gulist", gulist); //course 각 구
				model.addAttribute("totallist",totallist);//course 각 총가격
				model.addAttribute("clist", clist);//course 리스트
				model.addAttribute("flist", flist);//best food
				model.addAttribute("plist", plist);//best play
				return "main";
	}
}
