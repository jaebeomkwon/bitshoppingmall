package com.five.mall.model.service;

import java.util.List;

import com.five.mall.model.dto.CommentDto;

public interface CommentService {

	public void insertComment(CommentDto dto);
	
	public List<CommentDto> listComment(int productNo);
	
	public void deleteComment(int commentNo);
}
