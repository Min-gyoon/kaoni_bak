package com.kaoni.Board.DAO;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kaoni.Board.VO.BoardVO;
import com.kaoni.Board.VO.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO{

	Logger logger = Logger.getLogger(BoardDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BoardVO> ShowAllPost(Criteria cri) {
		return sqlSession.selectList("ShowAllPost", cri);
	}
	
	@Override
	public int WritePost(BoardVO bvo) {
		return sqlSession.insert("WritePost", bvo);
	}

	@Override
	public int UpdatePost(BoardVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("UpdatePost",bvo);
	}

	@Override
	public int DeletePost(BoardVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("DeletePost",bvo);
	}

	@Override
	public BoardVO DetailPost(int nbo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("DetailPost",nbo);
	}

	@Override
	public int listCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("listCount");
	}

	
	

}
