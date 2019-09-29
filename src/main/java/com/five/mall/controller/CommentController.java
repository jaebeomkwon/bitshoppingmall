package com.five.mall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.five.mall.model.dto.CommentDto;
import com.five.mall.model.service.CommentService;

@Controller
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/commentWrite.do")
	public String write(HttpSession session, CommentDto dto) {
		String userId = (String) session.getAttribute("userId");
		dto.setUserId(userId);
		commentService.insertComment(dto);
		return "redirect:productDetail.do?productNo="+dto.getProductNo();
	}
	
	@RequestMapping("/commentDelete.do")
	public String delete(int commentNo, int productNo) {
		commentService.deleteComment(commentNo);
		return "redirect:productDetail.do?productNo="+productNo;
	}
}
