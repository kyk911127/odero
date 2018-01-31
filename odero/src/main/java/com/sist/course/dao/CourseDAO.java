package com.sist.course.dao;

import java.util.List;

import javax.ws.rs.DELETE;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.place.dao.PlaceVO;

@Repository
public class CourseDAO {
    @Autowired
    private CourseMapper mapper;
    
    public PlaceVO course_place_data(int no) {
        return mapper.course_place_data(no);
    }
    
    
    //지역
    public List<PlaceVO> course_gu(){
        return mapper.course_gu();
    }
    
    
    //place-키워드
    
    public List<PlaceVO> course_fkeyword(){
        return mapper.course_fkeyword();
    }
    
    
    public List<PlaceVO> course_pkeyword(){
        return mapper.course_pkeyword();
    }
    
    
    public List<PlaceVO> course_ckeyword(){
        return mapper.course_ckeyword();
    }
    
    
    
    
    
    //컬럼의 행 삭제
    public void sfood_delete(String sf_key){
        mapper.sfood_delete(sf_key);
    }
    
    public void splay_delete(String sp_key){
        mapper.splay_delete(sp_key);
    }
    
    public void scafe_delete(String sc_key){
        mapper.scafe_delete(sc_key);
    }
    
    
    
    
    //카테고리테이블에 각각 키워드 넣기
    public void sfood_insert(String sf_key){
        mapper.sfood_insert(sf_key);
    }
    
    public void splay_insert(String sp_key){
    	 mapper.sfood_insert(sp_key);
    }
    
    public void scafe_insert(String sc_key){
    	 mapper.sfood_insert(sc_key);
    }
    
    
    
    
    public  List<SFoodVO> sfood_distinct(){
        return mapper.sfood_distinct();
    }
    
    public List<SPlayVO> splay_distinct(){
        return mapper.splay_distinct();
    }
    
    public List<SCafeVO> scafe_distinct(){
        return mapper.scafe_distinct();
    }
    

    //검색
    

}

