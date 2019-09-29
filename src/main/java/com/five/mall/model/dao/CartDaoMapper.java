package com.five.mall.model.dao;

import java.util.List;

import com.five.mall.model.dto.CartDto;

public interface CartDaoMapper {

	public List<CartDto> cartMoney();
	
	public void insert(CartDto dto);
	
	public List<CartDto> listCart(String userId);
	
	public void delete(int cartNo);
	
	public void deleteAll(String userId);
	
	public void update(int cartNo);
	
	public int sumMoney(String userId);
	
	public int countCart(String userId, int productNo);
	
	public void updateCart(CartDto dto);
	
	public void modifyCart(CartDto dto);
}
