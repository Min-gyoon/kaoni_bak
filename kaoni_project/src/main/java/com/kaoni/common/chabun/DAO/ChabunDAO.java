package com.kaoni.common.chabun.DAO;

import com.kaoni.Member.VO.MemberVO;
import com.kaoni.main.VO.MainVO;
import com.kaoni.pcr.VO.PcrVO;

public interface ChabunDAO {
	public MemberVO getMemberChabun();
	public MainVO getMainChabun();
	public PcrVO getPcrChabun();
}
