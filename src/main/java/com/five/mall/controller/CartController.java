package com.five.mall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.five.mall.model.dto.CartDto;
import com.five.mall.model.service.CartService;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;

	@RequestMapping("/cartInsert.do")
	public String insert(HttpSession session, CartDto dto) {

		String userId = (String) session.getAttribute("userId");

		if (userId != null) {
			
			dto.setUserId(userId);
			cartService.insert(dto);

			return "redirect:productList.do";
		}else {
			return "redirect:memberLogin.do";
		}
	}

	@RequestMapping("/cartList.do")
	public String list(HttpSession session, Model model) {

		String userId = (String) session.getAttribute("userId");
		if (userId != null) {
			List<CartDto> list = cartService.listCart(userId);

			int sumMoney = cartService.sumMoney(userId);

			int fee=3000;
			if(sumMoney>=40000) {
				fee=0;
			}
			model.addAttribute("sumMoney", sumMoney);
			model.addAttribute("fee", fee);
			model.addAttribute("sum", sumMoney + fee);
			model.addAttribute("list", list);
			model.addAttribute("count", list.size());

			return "product/cartList";
		} else {
			return "redirect:memberLogin.do";
		}
	}

	@RequestMapping("/cartDelete.do")
	public String delete(HttpSession session, int cartNo) {
		String userId = (String) session.getAttribute("userId");
		if (userId != null) { 
			cartService.delete(cartNo);
		}
		return "redirect:cartList.do";
	}

	@RequestMapping("cartDeleteAll.do")
	public String deleteAll(HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		if (userId != null) { 
			cartService.deleteAll(userId);
		}
		return "redirect:cartList.do";
	}

	@RequestMapping("cartUpdate.do")
	public String update(HttpSession session, @RequestParam List<Integer> amount, @RequestParam List<Integer> cartNo) {
		String userId = (String) session.getAttribute("userId");
		if (userId != null) {
			for (int i = 0; i < cartNo.size(); i++) {
				if (amount.get(i) == 0) {
					cartService.delete(cartNo.get(i));
				} else {
					CartDto dto = new CartDto();
					dto.setUserId(userId);
					dto.setCartNo(cartNo.get(i));
					dto.setAmount(amount.get(i));
					cartService.modifyCart(dto);
				}
			}
		}
		return "redirect:cartList.do";
	}
}
