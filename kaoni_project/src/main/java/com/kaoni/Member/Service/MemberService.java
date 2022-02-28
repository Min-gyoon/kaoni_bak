package com.kaoni.Member.Service;

import java.util.List;

import com.kaoni.Member.VO.MemberVO;

public interface MemberService {
	public List<MemberVO> memberSelectAll(MemberVO mvo);
}
