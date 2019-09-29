package com.five.mall.model.boardDao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.mall.model.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<BoardDto> selectBoardList() {
		return sqlSession.selectList("member.selectBoard1List");
	}

	@Override
	public void insertBoard(BoardDto param) {
		sqlSession.insert("member.insertBoard1",param);
	}

	@Override
	public BoardDto readBoard(String brdno) {
		return sqlSession.selectOne("member.board1Read", brdno);
	}

	@Override
	public void updateBoard(BoardDto param) {
		sqlSession.update("member.updateBoard1", param);
	}

	@Override
	public void deleteBoard(String brdno) {
		sqlSession.delete("member.board1Delete", brdno);
	}

	@Override
	public void updateBrdhit(String param) {
		sqlSession.update("member.brdHitUpdate", param);
	}
}
