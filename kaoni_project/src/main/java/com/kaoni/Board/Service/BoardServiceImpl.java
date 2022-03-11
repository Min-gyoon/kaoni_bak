package com.kaoni.Board.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaoni.Board.DAO.BoardDAO;
import com.kaoni.Board.VO.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> ShowAllPost(BoardVO bvo) {
		return boardDAO.ShowAllPost(bvo);
	}

	@Override
	public int WritePost(BoardVO bvo) {
		return boardDAO.WritePost(bvo);
	}

	@Override
	public String DeletePost(BoardVO bvo) {
		// TODO Auto-generated method stub
		return null;
	}

}
