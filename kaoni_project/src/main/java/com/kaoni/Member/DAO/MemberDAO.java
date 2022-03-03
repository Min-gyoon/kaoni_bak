package com.kaoni.Member.DAO;

import java.util.List;

import com.kaoni.Member.VO.MemberVO;

public interface MemberDAO {
	public List<MemberVO> memberSelectAll(MemberVO mvo);
	public int memberSignUp(MemberVO mvo);
	public List<MemberVO> memberLogin(MemberVO mvo);
	public int updateInfo(MemberVO mvo);
}
