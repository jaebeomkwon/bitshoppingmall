package com.five.mall.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductDto {

	private int productNo;
	private String productName;
	private int productPrice;
	private String productDesc;
	private String pictureUrl;
	private MultipartFile file;
	
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "ProductDto [productNo=" + productNo + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productDesc=" + productDesc + ", pictureUrl=" + pictureUrl + ", file=" + file + "]";
	}
	
	
	

}