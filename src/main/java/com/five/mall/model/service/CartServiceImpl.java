package com.five.mall.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.mall.model.dao.CartDaoMapper;
import com.five.mall.model.dto.CartDto;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDaoMapper dao;
	
	@Override
	public List<CartDto> cartMoney() {
		return dao.cartMoney();
	}
	@Override
	public void insert(CartDto dto) {
		dao.insert(dto); 
	}

	@Override
	public List<CartDto> listCart(String userId) {
		return dao.listCart(userId); 
	}

	@Override
	public void delete(int cartNo) {
		dao.delete(cartNo); 
	}

	@Override
	public void deleteAll(String userId) {
		dao.deleteAll(userId); 
	}

	@Override
	public void update(int cartNo) {

	}

	@Override
	public int sumMoney(String userId) {
		return dao.sumMoney(userId);
	}

	@Override
	public int countCart(String userId, int productNo) {
		return 0;
	}

	@Override
	public void updateCart(CartDto dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void modifyCart(CartDto dto) {
		dao.modifyCart(dto); 
	}
}