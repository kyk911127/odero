package com.sist.review;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
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
				vo.setR_imgname("");
			} else {
				vo.setR_imgname(img.split(",")[0]);
			}
		}
		/*File file = new File("/home/sist/"+fname);
		// 
		res.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(fname,"utf-8")); // attachment : �ٿ�ε� �ұ�� â
		res.setContentLength((int)file.length()); // 
		
		// ����ڿ��� ���� ���
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file)); // ���Ϸκ��� ī�ǹ޾ƿ���
		BufferedOutputStream bos = new BufferedOutputStream(res.getOutputStream()); // ����ڿ��� ����ϱ�
		
		//���� ī��
		int i=0;
		byte[] buffer = new byte[1024];
		while((i=bis.read(buffer, 0, 1024))!=-1){ // EOF �����ǳ� 
			bos.write(buffer, 0, i);
		}
		bis.close();
		bos.close();*/
		
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
		List<MultipartFile> list = uploadForm.getImages();
		File f = new File("/home/sist/");
		if (!f.exists())
			f.mkdir();
		if (list != null && list.size() > 0) {
			String fname = "";
			String fsize = "";
			for (MultipartFile mf : list) {
				String name = mf.getOriginalFilename();
				File file = new File("/home/sist/" + name);
				try {
					mf.transferTo(file);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
				fname += name + ",";
				fsize += file.length() + ",";
			}
			uploadForm.setR_imgname(fname.substring(0, fname.lastIndexOf(",")));
			uploadForm.setR_imgcount(list.size());
		} else {
			uploadForm.setR_imgname("");
			uploadForm.setR_imgcount(0);
		}
		dao.reviewInsert(uploadForm);
		return "redirect:review_list.do";
	}
}
