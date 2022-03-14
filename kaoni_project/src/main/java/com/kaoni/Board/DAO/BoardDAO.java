package com.kaoni.Board.DAO;

import java.util.List;

import com.kaoni.Board.VO.BoardVO;
import com.kaoni.Board.VO.Criteria;

public interface BoardDAO {

	public List<BoardVO> ShowAllPost(Criteria cri);
	public int WritePost(BoardVO bvo);
	public int UpdatePost(BoardVO bvo);
	public int DeletePost(BoardVO bvo);
	public BoardVO DetailPost(int nbo);
	public int listCount();
}
