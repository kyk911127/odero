package com.sist.mypage.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAO {
	@Autowired
	MyPageMapper mapper;
	public List<MyPagePlaceVO> MyPlaceBest5()
	{
		return mapper.MyPlaceBest5();
	}

}
