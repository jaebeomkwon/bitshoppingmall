package com.five.mall.model.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.five.mall.model.dto.MemberDto;

public interface MemberService {

	public boolean loginCheck(MemberDto dto, HttpSession session);

	public List<MemberDto> getMemberList();
	
	//////////////////////////////////////////////////
	
    public MemberDto info(String userId);
	
	boolean isMember(MemberDto dto, HttpSession session);
	
	void joinMember(MemberDto dto);
	
	public void idCheck(String userId, HttpServletResponse response) throws IOException;
	
	void updataMemberInfo(MemberDto dto);
}
