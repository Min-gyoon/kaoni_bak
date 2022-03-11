package com.kaoni.Board.DAO;

import java.util.List;

import com.kaoni.Board.VO.BoardVO;

public interface BoardDAO {

	public List<BoardVO> ShowAllPost(BoardVO bvo);
	public int WritePost(BoardVO bvo);
	public String DeletePost(BoardVO bvo);

}
