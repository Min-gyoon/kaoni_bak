package com.kaoni.Board.DAO;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kaoni.Board.VO.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO{

	Logger logger = Logger.getLogger(BoardDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BoardVO> ShowAllPost(BoardVO bvo) {
		return sqlSession.selectList("ShowAllPost", bvo);
	}
	
	@Override
	public int WritePost(BoardVO bvo) {
		return sqlSession.insert("WritePost", bvo);
	}

	@Override
	public String DeletePost(BoardVO bvo) {
		return null;
	}

	

}
