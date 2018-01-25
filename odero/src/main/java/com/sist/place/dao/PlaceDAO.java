package com.sist.place.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public class PlaceDAO {
	
	@Autowired
	private PlaceMapper mapper;
	
	public List<PlaceVO> placeListData(Map map)
	{
		return mapper.placeListData(map);
		
	}
	 
	//TotalPage
		public int placeTotalList() {
			return mapper.placeTotalList();
		}
}
