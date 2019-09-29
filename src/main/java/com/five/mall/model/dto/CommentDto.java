package com.five.mall.model.dto;

import java.util.Date;

public class CommentDto {

	private int commentNo;
	private int productNo;
	private String userId;
	private String commentContent;
	private Date commentDate;
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	@Override
	public String toString() {
		return "CommentDto [commentNo=" + commentNo + ", productNo=" + productNo + ", userId=" + userId
				+ ", commentContent=" + commentContent + ", commentDate=" + commentDate + "]";
	}
	
	
}
