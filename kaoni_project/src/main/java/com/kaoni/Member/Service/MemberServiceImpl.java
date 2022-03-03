package com.kaoni.Member.Service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaoni.Member.DAO.MemberDAO;
import com.kaoni.Member.VO.MemberVO;

@Transactional
@Service
public class MemberServiceImpl implements MemberService {
	Logger logger = Logger.getLogger(MemberServiceImpl.class);
	
	@Autowired(required=false)
	private MemberDAO memberDAO;	
		
	@Override
	public List<MemberVO> memberSelectAll(MemberVO mvo) {
		return memberDAO.memberSelectAll(mvo);
	}

	@Override
	public void memberSignUp(MemberVO mvo) {
		memberDAO.memberSignUp(mvo);
	}

	@Override
	public List<MemberVO> memberLogin(MemberVO mvo) {
		return memberDAO.memberLogin(mvo);
		
	}

	@Override
	public void memberUpdateInfo(MemberVO mvo) {
		memberDAO.memberUpdateInfo(mvo);
	}

}
