package com.five.mall.model.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.mall.model.dao.AdminDaoMapper;
import com.five.mall.model.dto.MemberDto;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDaoMapper dao;
	
	@Override
	public boolean loginCheck(MemberDto dto, HttpSession session) {
		
		String name = dao.loginCheck(dto);

		if (name != null) {
			session.setAttribute("adminUserId", dto.getUserId());
			session.setAttribute("adminName", name);
			session.setAttribute("userId", dto.getUserId());
			session.setAttribute("name", name);
			return true;
		}else {
			return false;
		}
	}
}
