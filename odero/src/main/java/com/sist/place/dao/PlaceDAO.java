package com.sist.place.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public class PlaceDAO {
	
	@Autowired
	private PlaceMapper mapper;
	
	// list
	public List<PlaceVO> placeListData(Map map) {
		return mapper.placeListData(map);
	}
	
	// detail
	public PlaceVO placeDetailData(int p_no) {
		return mapper.placeDetailData(p_no);
	}
	 
	// TotalPage
	public int placeTotalList() {
		return mapper.placeTotalList();
	}
	
	//Select list (이색/체험)
	public List<PlaceVO> placeSelectData_p(Map map){
		return mapper.placeSelectData_p(map);
	}
	
	//Select list Totalpage (이색/체험)
	public int placeTotalpage_sp(String sn_3){
		return mapper.placeTotalpage_sp(sn_3);
	}
	
	//Select list (맛집/카페)
	public List<PlaceVO> placeSelectData_cf(Map map){
		return mapper.placeSelectData_cf(map);
	}
	
	//Select list Totalpage(맛집/카페)
	public int placeTotalpage_cf(String sn_3){
		return mapper.placeTotalpage_cf(sn_3);
	}
}
