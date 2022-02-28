package com.kaoni.Member.DAO;

import java.util.List;

import com.kaoni.Member.VO.MemberVO;

public interface MemberDAO {
	public List<MemberVO> memberSelectAll(MemberVO mvo);
}
