package com.sist.course.dao;

import java.util.*;
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
    //키워드 가져오기
    public List<String> course_fkeyword(Map map) {
    	return mapper.course_fkeyword(map);
    }
    
    //컬럼의 행 삭제
    public void sfood_delete(){
        mapper.sfood_delete();
    }
    
    //카테고리테이블에 각각 키워드 넣기
    public void sfood_insert(Map map){
        mapper.sfood_insert(map);
    }
    
    
    public  List<String> sfood_distinct(String sf_grade){
        return mapper.sfood_distinct(sf_grade);
    }
    
    

}

