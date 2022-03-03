package com.kaoni.pcr.Service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaoni.pcr.DAO.PcrDAO;
import com.kaoni.pcr.VO.PcrVO;

@Service
@Transactional
public class PcrServiceImpl implements PcrService {
	
	@Autowired(required=false)
	private PcrDAO pcrdao;

	
	@Override
	public int pcrInsert(PcrVO pvo) {
		// TODO Auto-generated method stub
		return pcrdao.pcrInsert(pvo);
	}


	@Override
	public int pcrUpdate(PcrVO pvo) {
		// TODO Auto-generated method stub
		return pcrdao.pcrUpdate(pvo);
	}

}
