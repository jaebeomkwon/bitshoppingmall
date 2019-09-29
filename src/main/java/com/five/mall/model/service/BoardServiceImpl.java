package com.five.mall.model.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.five.mall.model.boardDao.BoardDao;
import com.five.mall.model.dto.BoardDto;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDao boardDao;
	
	@Override
	public List<BoardDto> selectBoardList() {
		return boardDao.selectBoardList();
	}

	@Override
	public void insertBoard(BoardDto param) {
		boardDao.insertBoard(param);
	}

	@Override
	public BoardDto readBoard(String brdno) {
		return boardDao.readBoard(brdno);
	}

	@Override
	public void updateBoard(BoardDto param) {
		boardDao.updateBoard(param);
		
	}

	@Override
	public void deleteBoard(String brdno) {
		boardDao.deleteBoard(brdno);
	}

	@Override
	public void updateBrdhit(String param) {
		boardDao.updateBrdhit(param);
	}
}
