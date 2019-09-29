package com.five.mall.model.dao;

import javax.servlet.http.HttpSession;

import com.five.mall.model.dto.MemberDto;

public interface AdminDaoMapper {
	
	public String loginCheck(MemberDto dto);
}
