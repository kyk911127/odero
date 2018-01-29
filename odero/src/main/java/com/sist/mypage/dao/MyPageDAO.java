package com.sist.mypage.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAO {
	@Autowired
	MyPageMapper mapper;
	public List<MyPagePlaceVO> MyPlaceBest5(String m_id)
	{
		return mapper.MyPlaceBest5(m_id);
	}
	
	public MyPageInfoVO MyPageInfoData(String m_id)
	{
		return mapper.MyPageInfoData(m_id);
	}
}
