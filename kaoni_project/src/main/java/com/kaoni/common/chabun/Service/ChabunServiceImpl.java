package com.kaoni.common.chabun.Service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaoni.Member.VO.MemberVO;
import com.kaoni.common.chabun.DAO.ChabunDAO;

@Service
@Transactional
public class ChabunServiceImpl implements ChabunService {
	private Logger logger = Logger.getLogger(ChabunServiceImpl.class);
	
	@Autowired
	private ChabunDAO chabunDAO;
	
	@Override
	public MemberVO getMemberChabun() {
		logger.info("------member chabun service-------");
		return chabunDAO.getMemberChabun();
	}

}
