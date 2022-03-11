package com.kaoni.main.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaoni.main.DAO.MainDAO;
import com.kaoni.main.VO.MainVO;
import com.kaoni.pcr.VO.PcrVO;
@Transactional
@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDAO dao;
	@Override
	public List<MainVO> pcrdata(MainVO mvo) {
		// TODO Auto-generated method stub
		return dao.pcrdata(mvo);
	}
	@Override
	public int pcrdatainsert(MainVO mvo) {
		// TODO Auto-generated method stub
		return dao.pcrdatainsert(mvo);
	}

}
