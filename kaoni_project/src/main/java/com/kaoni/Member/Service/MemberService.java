package com.kaoni.Member.Service;


import java.util.List;

import com.kaoni.Member.VO.MemberVO;

public interface MemberService {
	public int memberSignUp(MemberVO mvo);
	public MemberVO memberLogin(MemberVO mvo);
	public int updateInfo(MemberVO mvo);
}
