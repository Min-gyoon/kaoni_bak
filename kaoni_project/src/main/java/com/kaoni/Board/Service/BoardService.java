package com.kaoni.Board.Service;

import java.util.List;

import com.kaoni.Board.VO.BoardVO;
import com.kaoni.Board.VO.Criteria;

public interface BoardService {
	
	public List<BoardVO> ShowAllPost(BoardVO bvo);
	public int WritePost(BoardVO bvo);
	public int UpdatePost(BoardVO bvo);
	public int DeletePost(BoardVO bvo);
	public BoardVO DetailPost(int nbo);
	public int listCount();
}
