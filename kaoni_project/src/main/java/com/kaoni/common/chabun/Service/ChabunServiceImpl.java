package com.kaoni.common.chabun.Service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaoni.Member.VO.MemberVO;
import com.kaoni.common.chabun.DAO.ChabunDAO;
import com.kaoni.main.VO.MainVO;
import com.kaoni.pcr.VO.PcrVO;

@Service
@Transactional
public class ChabunServiceImpl implements ChabunService {
	private Logger logger = Logger.getLogger(ChabunServiceImpl.class);
	
	@Autowired(required=false)
	private ChabunDAO chabunDAO;

	@Override
	public MemberVO getMemberChabun() {
		// TODO Auto-generated method stub
		return chabunDAO.getMemberChabun();
	}

	@Override
	public MainVO getMainChabun() {
		// TODO Auto-generated method stub
		return chabunDAO.getMainChabun();
	}

	@Override
	public PcrVO getPcrChabun() {
		// TODO Auto-generated method stub
		return chabunDAO.getPcrChabun();
	}

}
