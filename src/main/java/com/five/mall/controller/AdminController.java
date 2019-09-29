package com.five.mall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.five.mall.model.dto.MemberDto;
import com.five.mall.model.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService; 
	
	@RequestMapping("/adminLogin.do")
	public String login() {
		return "admin/login"; 
	}
	
	@RequestMapping("/adminLoginCheck.do")
	public String loginCheck(HttpSession session, MemberDto dto, Model model) {
		
		String nextPage;
		
		boolean result = adminService.loginCheck(dto, session);
		
		if (result) {
			nextPage = "redirect:productList.do";
		} else {
			nextPage = "admin/login";
			model.addAttribute("message", "error");
		}
		return nextPage;
	}
	
	@RequestMapping("/adminLogout.do")
	public String logout(HttpSession session, Model model) {
		
		session.invalidate();
		
		return "redirect:productList.do";
	}
}

