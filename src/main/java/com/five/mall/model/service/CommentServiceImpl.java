package com.five.mall.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.mall.model.dao.CommentDaoMapper;
import com.five.mall.model.dto.CommentDto;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDaoMapper dao;
	
	@Override
	public void insertComment(CommentDto dto) {
		dao.insertComment(dto);
	}

	@Override
	public List<CommentDto> listComment(int productNo) {
		return dao.listComment(productNo);
	}

	@Override
	public void deleteComment(int commentNo) {
		dao.deleteComment(commentNo);
	}

}
