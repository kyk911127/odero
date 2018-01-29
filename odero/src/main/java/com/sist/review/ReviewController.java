package com.sist.review;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sist.review.dao.ReviewDao;
import com.sist.review.dao.ReviewVo;

@Controller
public class ReviewController {
	@Autowired
	private ReviewDao dao;

	@RequestMapping("review_list.do")
	public String reviewList(String page, Model model) {
		if (page == null)
			page = "1";
		System.out.println(page);
		int curpage = Integer.parseInt(page);
		int rowSize = 9;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;		
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		List<ReviewVo> list = dao.reviewList(map);
		for (ReviewVo vo : list) {
			String img = vo.getR_imgname();
			
			if (img.equals("-")) {
				img = "no_image.jpg";
				vo.setR_imgname(img);
			} else {
				img = img.split(",")[0];
				vo.setR_imgname(img);
			}
		}
		model.addAttribute("list", list);

		int totalpage = dao.reviewTotalList();
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);

		return "review/list";
	}

	@RequestMapping("review_insert")
	public String reviewInsertPage() {
		return "review/insert";
	}

	@RequestMapping("review_insert_ok")
	public String reviewInsert(ReviewVo uploadForm) {
		String path = "/home/sist/bigdataDev/bigdataStudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/odero/review/data";
		List<MultipartFile> list = uploadForm.getImages();
		File f = new File(path);
		if (!f.exists())
			f.mkdir();
		if (list != null && list.size() > 0) {
			String fname = "";
			for (MultipartFile mf : list) {
				String name = mf.getOriginalFilename();
				if (!name.equals("")) {
					File file = new File(path+"/"+ name);
					try {
						mf.transferTo(file);
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
					fname += name + ",";
				}
			}
			if (!fname.equals("")) {
				uploadForm.setR_imgname(fname.substring(0, fname.lastIndexOf(",")));
				uploadForm.setR_imgcount(list.size());
			} else {
				uploadForm.setR_imgname("-");
				uploadForm.setR_imgcount(0);
			}
		} else {
			uploadForm.setR_imgname("-");
			uploadForm.setR_imgcount(0);
		}
		dao.reviewInsert(uploadForm);
		return "redirect:review_list.do";
	}
	
	@RequestMapping("review_detail.do")
	public String reviewDetail(int r_no,Model model) {
		dao.reviewHitIncrement(r_no);
		ReviewVo vo = dao.reviewDetail(r_no);
		
		if (vo.getR_imgcount()>0) {
			String[] images = vo.getR_imgname().split(",");
			vo.setR_imgname(images[0]);
			model.addAttribute("images",images);
		}
		model.addAttribute("vo", vo);
		return "review/detail";
	}
}
