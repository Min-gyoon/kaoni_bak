package com.kaoni.Board.Service;

import java.util.List;

import com.kaoni.Board.VO.BoardVO;

public interface BoardService {
	
	public List<BoardVO> ShowAllPost(BoardVO bvo);
	public int WritePost(BoardVO bvo);
	public String DeletePost(BoardVO bvo);
}
