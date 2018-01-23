package com.sist.cart.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {
	@Autowired
	CartMapper mapper;
	public List<CartPlaceVO> CartPlaceBest5()
	{
		return mapper.CartPlaceBest5();
	}
}
