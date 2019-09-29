package com.five.mall.model.boardDao;

import java.util.List;

import com.five.mall.model.dto.BoardDto;

public interface BoardDao {

    public List<BoardDto> selectBoardList();
	
	public void insertBoard(BoardDto param);
	
	public BoardDto readBoard(String brdno);
	
	public void updateBoard(BoardDto param);
	
	public void deleteBoard(String brdno);
	
	public void updateBrdhit(String param);
}
