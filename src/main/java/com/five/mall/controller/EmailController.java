package com.five.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.five.mall.model.dto.EmailDto;
import com.five.mall.model.service.EmailService;

@Controller
public class EmailController {

	@Autowired
	private EmailService emailService;

	@RequestMapping("/emailWrite.do")
	public String write(String email, Model model) {
		model.addAttribute("email",email);
		return "/email/write";
	}

	@RequestMapping("/emailSend.do")
	public String send(EmailDto dto, Model model) {
		if (!dto.getFile().isEmpty()) {
			String fileName = dto.getFile().getOriginalFilename();
			dto.setPictureUrl(fileName);
		}
		emailService.sendMail(dto);
		model.addAttribute("message", "이메일이 전송 되었습니다.");

		return "email/write";
	}
}
