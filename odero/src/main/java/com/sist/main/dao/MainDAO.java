package com.sist.main.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.place.dao.PlaceVO;
@Repository
public class MainDAO {
	@Autowired
	private MainMapper mapper;
	
	public List<PlaceVO> best_food(){
		
		return mapper.best_food();
	}
	public List<PlaceVO> best_play(){
		return mapper.best_play();
	}
}
