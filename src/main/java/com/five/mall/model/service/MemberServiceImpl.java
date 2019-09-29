package com.five.mall.model.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.mall.model.dao.MemberDaoMapper;
import com.five.mall.model.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDaoMapper dao;
	
	
	@Override
	public boolean loginCheck(MemberDto dto, HttpSession session) {

		String name = dao.loginCheck(dto);

		if (name != null) {
			session.setAttribute("userId", dto.getUserId());
			session.setAttribute("name", name);
			return true;
		}else {
			return false;
		}
	}

	@Override
	public List<MemberDto> getMemberList() {
		List<MemberDto> list = dao.getMemberList();
		return list;
	}
	
	/////////////////////////////////////////////////////////
	
	@Override
	public boolean isMember(MemberDto dto, HttpSession session) {
		String name = dao.loginCheck(dto);

		if (name != null) {
			session.setAttribute("userId", dto.getUserId());
			session.setAttribute("name", name);
			return true;
		}else {
			return false;
		}
	}

	@Override
	public void joinMember(MemberDto dto) {
		dao.insertMemberInfo(dto);
	}
	


	@Override
	public void idCheck(String userId, HttpServletResponse response) throws IOException {
		
		MemberDto dto = dao.idCheck(userId);
		
		if(dto == null) {
			response.getWriter().print("1");
		}else {
			response.getWriter().print("0");
		}

	}

	@Override
	public void updataMemberInfo(MemberDto dto) {
		
		
	}


	@Override
	public MemberDto info(String userId) {
		// TODO Auto-generated method stub
		return dao.info(userId);
	}

	
}
