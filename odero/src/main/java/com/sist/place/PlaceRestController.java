package com.sist.place;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.place.dao.PlaceDAO;
import com.sist.place.dao.PlaceVO;
import com.sist.mypage.dao.*;


@RestController
public class PlaceRestController {
  @Autowired
  private PlaceDAO dao;
 
 
  //전체데이터 뿌리기1
  @RequestMapping("s_list_start.do")
  public String placeListData(String page) {
        String json="";
       
        if(page==null)
            page="1";
        int curpage= Integer.parseInt(page);
        int rowsize=8;
        int start=(rowsize*curpage)-(rowsize-1);
        int end= rowsize * curpage;
       
        Map map=new HashMap();
        map.put("start", start);
        map.put("end", end);
       
        int totalpage = dao.placeTotalList();
       
       
       
        List<PlaceVO> list =dao.placeListData(map);
       
        JSONArray arr=new JSONArray();
       
        for(PlaceVO vo:list)
        {
            JSONObject obj=new JSONObject();
            obj.put("p_no", vo.getP_no());
            obj.put("p_img",vo.getP_img());
            if(vo.getP_addr().length()>=18)
            {
                String saddr=vo.getP_addr().substring(0, 17);
                vo.setP_addr(saddr);
            }
            obj.put("p_addr",vo.getP_addr());
            if(vo.getP_name().length()>=11)
            {
                String sname=vo.getP_name().substring(0, 10);
                vo.setP_name(sname);
            }
            obj.put("p_name",vo.getP_name());
           
           
            String skey="";
           
            if(vo.getP_keyword()!=null)
            {
                String[] s_keyword=vo.getP_keyword().split("[,]");
                if(s_keyword.length<=3)
                {
                    for(int i=0; i<s_keyword.length; i++)
                    {
                       
                        skey+=(" #"+s_keyword[i]);
                        vo.setP_keyword(skey);
                    }
                }
                else   //3초과일때
                {
                    for(int i=0; i<3; i++)
                    {
                        skey+=(" #"+s_keyword[i]);
                        vo.setP_keyword(skey);
                    }
                }
               
               
            }
           
            obj.put("p_keyword",vo.getP_keyword());
           
            obj.put("p_price",vo.getP_price());
            obj.put("p_totalpage", totalpage);
            obj.put("p_curpage", curpage);
            arr.add(obj);
        }
       
       json=arr.toJSONString();   
       
       
        return json;
    }
 
 
  //선택된 데이터 뿌리기
  @RequestMapping("s_list.do")
  public String s_list_page(String sn_1,String sn_3,String page)
  {
     
      String json="";
      if(page==null)
            page="1";
        int curpage= Integer.parseInt(page);
        int rowsize=8;
        int start=(rowsize*curpage)-(rowsize-1);
        int end= rowsize * curpage;
       
        Map map=new HashMap();
        map.put("sn_3", sn_3);
        map.put("start", start);
        map.put("end", end);
       
   
        if(sn_1.equals("이색/체험"))
        {
            List<PlaceVO> sp_list = dao.placeSelectData_p(map);
            int sp_totalpage=dao.placeTotalpage_sp(sn_3);

           
            JSONArray arr=new JSONArray();
            for(PlaceVO vo:sp_list)
            {
                JSONObject obj=new JSONObject();
                obj.put("p_no", vo.getP_no());
                if(vo.getP_img()==null)
                {
                    vo.setP_img("이미지 준비중");
                }
               
                obj.put("p_img",vo.getP_img());
                if(vo.getP_addr().length()>=18)
                {
                    String saddr=vo.getP_addr().substring(0, 17);
                    vo.setP_addr(saddr);
                }
                obj.put("p_addr",vo.getP_addr());
                if(vo.getP_name().length()>=11)
                {
                    String sname=vo.getP_name().substring(0, 10);
                    vo.setP_name(sname);
                }
                obj.put("p_name",vo.getP_name());
                /*if(vo.getP_keyword()!=null && vo.getP_keyword().length()>=15)
                {
                    String str=vo.getP_keyword().substring(0, 13);
                    vo.setP_keyword(str);
                }*/
               
                String skey="";
               
                if(vo.getP_keyword()!=null)
                {
                    String[] s_keyword=vo.getP_keyword().split("[,]");
                    if(s_keyword.length<=3)
                    {
                        for(int i=0; i<s_keyword.length; i++)
                        {
                           
                            skey+=(" #"+s_keyword[i]);
                            vo.setP_keyword(skey);
                        }
                    }
                    else   //3초과일때
                    {
                        for(int i=0; i<3; i++)
                        {
                            skey+=(" #"+s_keyword[i]);
                            vo.setP_keyword(skey);
                        }
                    }
                   
                   
                }
                obj.put("p_keyword",vo.getP_keyword());
                obj.put("p_price",vo.getP_price());
                obj.put("p_totalpage", sp_totalpage);
                obj.put("p_curpage", curpage);
                arr.add(obj);
            }
           json=arr.toJSONString();   
        }
        else 
        {
            List<PlaceVO> cf_list=dao.placeSelectData_cf(map);
            int cf_totalpage=dao.placeTotalpage_cf(sn_3);
           
   
            JSONArray arr=new JSONArray();
            for(PlaceVO vo:cf_list)
            {
                JSONObject obj=new JSONObject();
                obj.put("p_no", vo.getP_no());
                obj.put("p_img",vo.getP_img());
                if(vo.getP_addr().length()>=18)
                {
                    String saddr=vo.getP_addr().substring(0, 17);
                    vo.setP_addr(saddr);
                }
                obj.put("p_addr",vo.getP_addr());
                if(vo.getP_name().length()>=11)
                {
                    String sname=vo.getP_name().substring(0, 10);
                    vo.setP_name(sname);
                }
                obj.put("p_name",vo.getP_name());
                /*if(vo.getP_keyword()!=null && vo.getP_keyword().length()>=15)
                {
                    String str=vo.getP_keyword().substring(0, 14);
                    vo.setP_keyword(str);
                }*/
               
                String skey="";
               
                if(vo.getP_keyword()!=null)
                {
                    String[] s_keyword=vo.getP_keyword().split("[,]");
                    if(s_keyword.length<=3)
                    {
                        for(int i=0; i<s_keyword.length; i++)
                        {
                           
                            skey+=(" #"+s_keyword[i]);
                            vo.setP_keyword(skey);
                        }
                    }
                    else   //3초과일때
                    {
                        for(int i=0; i<3; i++)
                        {
                            skey+=(" #"+s_keyword[i]);
                            vo.setP_keyword(skey);
                        }
                    }
                     
                   
                }
               
                obj.put("p_keyword",vo.getP_keyword());
                obj.put("p_price",vo.getP_price());
                obj.put("p_totalpage", cf_totalpage);
                obj.put("p_curpage", curpage);
                arr.add(obj);
            }
           json=arr.toJSONString();   
           
        }
       

      return json;  //[{},{},{}]
  }
  
  
  //찜하기
  @RequestMapping("jjim.do")
  public boolean jjim (String m_id,String p_no)
  {
	  
	  Map map=new HashMap();
      map.put("m_id", m_id);
      map.put("p_no", p_no);
      
      int count=dao.jjimCount(map);
      boolean bCheck=false;
      
      if(count==0)
      {
    	  dao.jjimInsert(map);
    	  bCheck=true;
      }
     
      
     /*JSONObject obj=new JSONObject();
     obj.put("bCheck", bCheck);*/
   
	  
	  return bCheck;
  }
  
  
  //찜정보
  @RequestMapping("jjim_info.do")
  public String jjim_info(String m_id)
  {
	  String json="";
	  
	  List<String> jjim_pno=dao.jjimInfo(m_id);
	  
	  /*for(int i = 0; i<jjim_pno.size();i++)
		  System.out.println(jjim_pno.get(i));*/
	  
	 JSONArray arr=new JSONArray();
	 
	  
	  
	 for(String a:jjim_pno)
		 {
		 	JSONObject obj=new JSONObject();
		 
			obj.put("jjim_pno", a);
			arr.add(obj);
		 }
	  
	 
	  json=arr.toJSONString();
	 
	  
	  return json;
	  

  }
  
} 