package com.kaoni.pcr.Service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaoni.pcr.DAO.PcrDAO;
import com.kaoni.pcr.VO.PcrVO;

@Service
@Transactional
public class PcrServiceImpl implements PcrService {
	Logger logger = Logger.getLogger(PcrServiceImpl.class);  
	
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


	@Override
	public List<PcrVO> pcrSelectAll(PcrVO pvo) {
		// TODO Auto-generated method stub
		return pcrdao.pcrSelectAll(pvo);
	}


	@Override
	public List<PcrVO> pcrUpdateForm(PcrVO pvo) {
		// TODO Auto-generated method stub
		return pcrdao.pcrUpdateForm(pvo);
	}


	
	  @Override public List<PcrVO> pcrMain(PcrVO pvo) { 
		  logger.info("pcrmain service 진입");
	  return pcrdao.pcrMain(pvo); }


	@Override
	public List<PcrVO> pcrMine(PcrVO pvo) {
		// TODO Auto-generated method stub
		 return pcrdao.pcrMine(pvo);
	}


	@Override
	public List<PcrVO> pcrSearch(PcrVO pvo) {
		// TODO Auto-generated method stub
		return pcrdao.pcrSearch(pvo);
	}
	 

}
