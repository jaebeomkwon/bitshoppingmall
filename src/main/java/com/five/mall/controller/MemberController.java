package com.five.mall.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.five.mall.model.dto.MemberDto;
import com.five.mall.model.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping("/memberLogin.do")
	public String login() {
		return "member/login";
	}

//	@RequestMapping("/memberLoginCheck.do")
//	public String loginCheck(MemberDto dto, HttpSession session, Model model) {
//
//		String nextPage;
//
//		boolean result = memberService.loginCheck(dto, session);
//
//		if (result) {
//			nextPage = "redirect:productList.do";
//		} else {
//			nextPage = "member/login";
//			model.addAttribute("message", "error");
//		}
//		return nextPage;
//	}
//
	@RequestMapping("/memberLogout.do")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:productList.do";
	}
	
	@RequestMapping("/memberList.do")
	public String list(Model model) {
		
		List<MemberDto> list = memberService.getMemberList();
		
		model.addAttribute("list",list);
		
		return "member/memberList";
	}
	
	
	@RequestMapping(value = "/loginProcess.do", method = RequestMethod.POST)
	public String loginProcess(@ModelAttribute MemberDto dto , HttpSession session) {
		
		String nextPage = memberService.isMember(dto,session) ? "redirect:productList.do":"redirect:memberLogin.do";

		return nextPage;
	}
	@RequestMapping("/join.do")
	public String join() {
		return "member/join";
	}
	@RequestMapping(value="/joinProcess.do", method=RequestMethod.POST)
	public String joinProcess(MemberDto dto) {
		memberService.joinMember(dto);
		return "redirect:memberLogin.do";
	}
	@RequestMapping(value ="/idCheck.do", method= RequestMethod.POST)
	public void postIdCheck(HttpServletRequest req, String userId, HttpServletResponse response) throws IOException {
		
		memberService.idCheck(userId,response);
	}
	@RequestMapping(value="/updateLogin.do")
	public String updateLogin(HttpSession session, MemberDto dto) {
		
		return "member/update";
	}
	@RequestMapping(value="/updateProcess.do")
	public String updateProcess(MemberDto dto, HttpSession session) {
		
		dto.setUserId((String)session.getAttribute("userId"));
		
		memberService.updataMemberInfo(dto);
		
		return "/product/productList";
	}
	
	

}
