package com.kaoni.Member.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kaoni.Member.VO.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	public List<MemberVO> memberSelectAll(MemberVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberSelectAll", mvo);
	}

}
