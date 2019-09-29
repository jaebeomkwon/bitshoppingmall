package com.five.mall.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.five.mall.model.dto.CommentDto;
import com.five.mall.model.dto.ProductDto;
import com.five.mall.model.service.CommentService;
import com.five.mall.model.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}

	@RequestMapping("/productList.do")
	public String list(Model model) {
		List<ProductDto> list = productService.listProduct();
		model.addAttribute("list", list);
		return "product/productList";
	}

	@RequestMapping("/productDetail.do")
	public String detail(int productNo, Model model) {
		ProductDto dto = productService.detailProduct(productNo);
		model.addAttribute("dto", dto);
		List<CommentDto> cList = commentService.listComment(productNo);
		model.addAttribute("cList", cList);
		return "product/productDetail";
	}

	@RequestMapping("/productWrite.do")
	public String write() {
		return "product/productWrite";
	}

	@RequestMapping("/productInsert.do")
	public String insert(ProductDto dto) {
		String fileName = "Empty";
		if (!dto.getFile().isEmpty()) {
			fileName = dto.getFile().getOriginalFilename();
			try {
				String path = "D:\\pr\\FiveJo\\src\\main\\webapp\\resources\\images\\";
				//String path = "D:\\sts-web-work\\FiveJo\\src\\main\\webapp\\resources\\images\\";
				dto.getFile().transferTo(new File(path + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setPictureUrl(fileName);
		productService.insertProduct(dto);
		return "redirect:productList.do";
	}

	@RequestMapping("/productEdit.do")
	public String edit(int productNo, Model model) {
		ProductDto dto = productService.detailProduct(productNo);
		model.addAttribute("dto", dto);
		return "product/productEdit";
	}

	@RequestMapping("/productUpdate.do")
	public String update(ProductDto dto) {
		if (!dto.getFile().isEmpty()) {
			String fileName = dto.getFile().getOriginalFilename();
			try {
				String path = "D:\\pr\\FiveJo\\src\\main\\webapp\\resources\\images\\";
				//String path = "D:\\sts-web-work\\FiveJo\\src\\main\\webapp\\resources\\images\\";
				dto.getFile().transferTo(new File(path + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setPictureUrl(fileName);
		} 
		productService.updateProduct(dto);
		return "redirect:productList.do";
	}
	
	@RequestMapping("/productDelete.do")
	public String delete(ProductDto dto) {
		String fileName=dto.getPictureUrl();
		if(!fileName.equals("Empty")) {
			String path = "D:\\pr\\FiveJo\\src\\main\\webapp\\resources\\images\\";
			//String path = "D:\\sts-web-work\\FiveJo\\src\\main\\webapp\\resources\\images\\";
			File f=new File(path+fileName);
			if(f.exists()) {
				f.delete();
			}
		}
		productService.deleteProduct(dto.getProductNo());
		return "redirect:productList.do";
	}

}
