package com.kaoni.Member.DAO;


import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kaoni.Member.VO.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	Logger logger = Logger.getLogger(MemberDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public int memberSignUp(MemberVO mvo) {
		return sqlSession.insert("memberSignUp", mvo);
	}
	@Override
	public MemberVO memberLogin(MemberVO mvo){
		return sqlSession.selectOne("memberLogin",mvo);
	}
	
	@Override
	public int updateInfo(MemberVO mvo) {
		return sqlSession.update("updateInfo", mvo);
	}
	@Override
	public List<MemberVO> memberSelectAll(MemberVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberSelectAll", mvo);
	}
	@Override
	public List<MemberVO> memberUpdateForm(MemberVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberUpdateForm", mvo);
	}



	

}
