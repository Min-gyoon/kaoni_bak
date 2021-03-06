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
	public int memberSignUp(MemberVO mvo) {
		return memberDAO.memberSignUp(mvo);
	}

	@Override
	public MemberVO memberLogin(MemberVO mvo) {
		return memberDAO.memberLogin(mvo);
	}

	@Override
	public int updateInfo(MemberVO mvo) {
		 return memberDAO.updateInfo(mvo);
	}

	@Override
	public List<MemberVO> memberSelectAll(MemberVO mvo) {
		// TODO Auto-generated method stub
		return memberDAO.memberSelectAll(mvo);
	}

	@Override
	public List<MemberVO> memberUpdateForm(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("memberupdateform진입");
		return memberDAO.memberUpdateForm(mvo);
	}

	@Override
	public int idCheck(MemberVO mvo) {
		logger.info("Serivce");
		return memberDAO.idCheck(mvo);
	}


}
