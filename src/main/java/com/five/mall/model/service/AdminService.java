package com.five.mall.model.service;

import javax.servlet.http.HttpSession;

import com.five.mall.model.dto.MemberDto;

public interface AdminService {

	public boolean loginCheck(MemberDto dto, HttpSession session);
}
