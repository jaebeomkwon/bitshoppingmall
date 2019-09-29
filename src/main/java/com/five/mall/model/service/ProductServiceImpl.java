package com.five.mall.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.mall.model.dao.ProductDaoMapper;
import com.five.mall.model.dto.ProductDto;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDaoMapper Dao;
	
	@Override
	public List<ProductDto> listProduct() {
		return Dao.listProduct(); 
	}

	@Override
	public ProductDto detailProduct(int productNo) {
		return Dao.detailProduct(productNo); 
	}
	
	@Override
	public void updateProduct(ProductDto dto) {
		Dao.updateProduct(dto); 
	}
	
	@Override
	public void deleteProduct(int productNo) {
		Dao.deleteProduct(productNo); 
	}

	@Override
	public void insertProduct(ProductDto dto) {
		Dao.insertProduct(dto); 
	}

	@Override
	public String attachedFileInfo(int productNo) {
		return Dao.attachedFileInfo(productNo); 
	}
}
