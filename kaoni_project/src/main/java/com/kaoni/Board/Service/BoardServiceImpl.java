package com.kaoni.Board.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaoni.Board.DAO.BoardDAO;
import com.kaoni.Board.VO.BoardVO;
import com.kaoni.Board.VO.Criteria;

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
	public int UpdatePost(BoardVO bvo) {
		// TODO Auto-generated method stub
		return boardDAO.UpdatePost(bvo);
	}

	@Override
	public int DeletePost(BoardVO bvo) {
		// TODO Auto-generated method stub
		return boardDAO.DeletePost(bvo);
	}

	@Override
	public BoardVO DetailPost(int nbo) {
		// TODO Auto-generated method stub
		return boardDAO.DetailPost(nbo);
	}

	@Override
	public int listCount() {
		// TODO Auto-generated method stub
		return boardDAO.listCount(); //게시물 촛 갱수
	}

	

}
