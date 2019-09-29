package com.five.mall.model.dao;

import java.util.List;

import com.five.mall.model.dto.ProductDto;

public interface ProductDaoMapper {

	public List<ProductDto> listProduct();
	
	public ProductDto detailProduct(int productNo);
	
	public void updateProduct(ProductDto dto);
	
	public void deleteProduct(int productNO);
	
	public void insertProduct(ProductDto dto);
	
	public String attachedFileInfo(int productNo);

}
