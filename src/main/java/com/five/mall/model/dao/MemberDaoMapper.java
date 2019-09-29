package com.five.mall.model.dao;

import java.util.List;

import com.five.mall.model.dto.MemberDto;

public interface MemberDaoMapper {

	public String loginCheck(MemberDto dto);
	
	public MemberDto viewMember(String userId);

	public List<MemberDto> getMemberList();
	
    /////////////////////////////////////////////////
	
	
	public MemberDto getMemberJoinInfo(MemberDto dto);
	
	void insertMemberInfo(MemberDto dto);

	
	public MemberDto idCheck(String userId);


	public void updataMemberInfo(MemberDto dto);

	public MemberDto info(String userId);
}
