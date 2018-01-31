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
    public void sfood_delete(){
        mapper.sfood_delete();
    }
    
    public void splay_delete(){
        mapper.splay_delete();
    }
    
    public void scafe_delete(){
        mapper.scafe_delete();
    }
    
    
    
    
    //카테고리테이블에 각각 키워드 넣기
    public List<SFoodVO> sfood_insert(){
        return mapper.sfood_insert();
    }
    
    public List<SPlayVO> splay_insert(){
        return mapper.splay_insert();
    }
    
    public List<SCafeVO> scafe_insert(){
        return mapper.scafe_insert();
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
    

    //

}

