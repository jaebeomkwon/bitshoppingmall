package com.five.mall.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.five.mall.model.dto.BoardDto;
import com.five.mall.model.service.BoardService;

@Controller
public class BoardController {

	@Inject
	BoardService boardSvc;
	
	@RequestMapping(value="/boardList.do")
	public String boardList(ModelMap modelMap)throws Exception {
		List<BoardDto> listview=boardSvc.selectBoardList();
		modelMap.addAttribute("listview", listview);
		
		return "board/boardList";
	}
	
	@RequestMapping(value="/board1Read")
	public String boardRead(HttpServletRequest request,ModelMap model){
		String brdno=request.getParameter("brdno");

		boardSvc.updateBrdhit(brdno);
		BoardDto boardInfo=boardSvc.readBoard(brdno);
		model.addAttribute("boardInfo", boardInfo);
		
		return "board/boardRead";
	}
	
	@RequestMapping(value="boardForm")
	public String boardForm(HttpServletRequest request,ModelMap model){
		String brdno = request.getParameter("brdno");
		if(brdno!=null) {
			System.out.println("게시물 번호 : " +brdno);
			BoardDto boardInfo=boardSvc.readBoard(brdno);
			model.addAttribute("boardInfo", boardInfo);			
		}else {
			System.out.println("게시물번호 못받음");
			}
		
		return "board/boardForm";
	}
	
	@RequestMapping(value="boardSave")
	public String boardSave(@ModelAttribute BoardDto boardInfo, HttpSession session){
		System.out.println("게시물 입력댐 : "+boardInfo.getBrdno());
		if(boardInfo.getBrdno()=="") {
			String userId = (String) session.getAttribute("userId");
			boardInfo.setBrdwriter(userId);
			boardSvc.insertBoard(boardInfo);
		}else {
			boardSvc.updateBoard(boardInfo);
		}
				
		return "redirect:boardList.do";
	}
	
	@RequestMapping(value="board1Delete")
	public String boardDelete(HttpServletRequest request)throws Exception{
		String brdno = request.getParameter("brdno");
		boardSvc.deleteBoard(brdno);
		
		return "redirect:boardList.do";
	}
	
	@RequestMapping(value="/board1UpdateSave")
	public String boardUpdateSave(@ModelAttribute BoardDto boardInfo)throws Exception{
		//List -> write -> insert 
		boardSvc.updateBoard(boardInfo);
		
		return "redirect:boardList.do";
	}
	
	
	
	
}
