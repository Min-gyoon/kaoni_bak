package com.kaoni.Member.DAO;


import com.kaoni.Member.VO.MemberVO;

public interface MemberDAO {

	public MemberVO memberLogin(MemberVO mvo);
	public int memberSignUp(MemberVO mvo);
	public int updateInfo(MemberVO mvo);
}
