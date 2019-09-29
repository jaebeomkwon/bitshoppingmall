package com.five.mall.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ImageUploadController {

	@RequestMapping("/imageUpload.do")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile upload)	throws Exception {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String fileName = upload.getOriginalFilename();
		
		byte[] bytes = upload.getBytes();
		
		String uploadPath = "D:\\sts-web-work\\FiveJo\\src\\main\\webapp\\resources\\images\\";
		
		OutputStream os = new FileOutputStream(new File(uploadPath + fileName));
		os.write(bytes);
		String callback = request.getParameter("CKEditorFuncNum");
		PrintWriter pw = response.getWriter();
		String fileUrl = request.getContextPath() + "/resources/images/" + fileName;
		pw.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl
				+ "','이미지가 전송되었습니다.')</script>");
		pw.flush();
		pw.close();
		os.close();
	}
}
