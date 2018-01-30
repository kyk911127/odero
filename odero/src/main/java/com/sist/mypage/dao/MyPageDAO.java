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
	public List<MyPageCosVO> MyCosBestFood(String m_id)
	{
		return mapper.MyCosBestFood(m_id);
	}
	public List<MyPageCosVO> MyCosBestCafe (String m_id)
	{
		return mapper.MyCosBestCafe(m_id);
	}
	public List<MyPageCosVO> MyCosBestPlay (String m_id)
	{
		return mapper.MyCosBestPlay(m_id);
	}
}
