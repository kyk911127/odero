package com.sist.course.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.place.dao.PlaceVO;

public interface CourseMapper {

	//추천 장소 데이터
	@Select("SELECT p_no, p_name, p_addr, p_tel, p_hit, p_grade "
			+ "FROM place "
			+ "WHERE p_no = #{no}")
	public PlaceVO course_place_data(int no);
	
	
	@Select("SELECT p_addr FROM place "
            + "WEHER p_addr LIKE '%은평% "
            + "AND p_addr LIKE '%마포% "
            + "AND p_addr LIKE '%서대문% "
            + "AND p_addr LIKE '%종로% "
            + "AND p_addr LIKE '%용산% "
            + "AND p_addr LIKE '%중% "
            + "AND p_addr LIKE '%성동% "
            + "AND p_addr LIKE '%광진% "
            + "AND p_addr LIKE '%중랑% "
            + "AND p_addr LIKE '%성북% "
            + "AND p_addr LIKE '%노원% "
            + "AND p_addr LIKE '%도봉% "
            + "AND p_addr LIKE '%중구% "
            + "AND p_addr LIKE '%강서% "
            + "AND p_addr LIKE '%양천% "
            + "AND p_addr LIKE '%영등포% "
            + "AND p_addr LIKE '%구로% "
            + "AND p_addr LIKE '%동작% "
            + "AND p_addr LIKE '%금천% "
            + "AND p_addr LIKE '%관악% "
            + "AND p_addr LIKE '%서초% "
            + "AND p_addr LIKE '%강남% "
            + "AND p_addr LIKE '%송파% "
            + "AND p_addr LIKE '%강동%")
    public List<PlaceVO> course_gu();
    
    
    
    
    //맛집키워드
    @Select("SELECT p_keyword, num "
            + "FROM (SELECT p_keyword, rownum as num "
            + "FROM (SELECT p_keywordr "
            + "FROM place "
            + "WHERE p_grade='f')")
    public List<PlaceVO> course_fkeyword();
    
    //놀거리키워드
    @Select("SELECT p_keyword, num "
            + "FROM (SELECT p_keyword, rownum as num "
            + "FROM (SELECT p_keyword "
            + "FROM place "
            + "WHERE p_grade='p')")
    public List<PlaceVO> course_pkeyword();
    
    //카페키워드
    @Select("SELECT p_keyword, num "
            + "FROM (SELECT p_keyword, rownum as num "
            + "FROM (SELECT p_keyword "
            + "FROM place "
            + "WHERE p_grade='c')")
    public List<PlaceVO> course_ckeyword();
    
    
    
    //각각의 카테고리 테이블 데이터 삭제
    @Delete("DELETE sf_key FROM sfood")
    public void sfood_delete();
    
    @Delete("DELETE sp_key FROM splay")
    public void splay_delete();
    
    @Delete("DELETE sc_key FROM scafe")
    public void scafe_delete();
    
    
    
    //맛집테이블에 키워드 넣기
    @Insert("INSERT INTO sfood VALUSE(#{sf_key})")
    public List<SFoodVO> sfood_insert();
    
    //놀거리테이블에 키워드 넣기
    @Insert("INSERT INTO splay VALUSE(#{sp_key})")
    public List<SPlayVO> splay_insert();
        
    //카페테이블에 키워드 넣기
    @Insert("INSERT INTO scafe VALUSE(#{sc_key})")
    public List<SCafeVO> scafe_insert();
    
    
    
    //각테이블마다 중복제거 
    @Select("SELECT DISTINCT sf_key from sfood")
    public List<SFoodVO> sfood_distinct();
    
    @Select("SELECT DISTINCT sp_key from splay")
    public List<SPlayVO> splay_distinct();
    
    @Select("SELECT DISTINCT sc_key from scafe")
    public List<SCafeVO> scafe_distinct();
    
    
    
    
    
    
    
    
    
    
    
    
}


