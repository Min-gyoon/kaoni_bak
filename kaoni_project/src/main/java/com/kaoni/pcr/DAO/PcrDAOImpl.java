package com.kaoni.pcr.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kaoni.pcr.VO.PcrVO;

public class PcrDAOImpl implements PcrDAO {

	@Autowired
	private SqlSessionTemplate sqlssesion;


	@Override
	public int pcrInsert(PcrVO pvo) {
		// TODO Auto-generated method stub
		return sqlssesion.insert("pcrInsert", pvo);
	}


	@Override
	public int pcrUpdate(PcrVO pvo) {
		// TODO Auto-generated method stub
		return sqlssesion.update("pcrUpdate", pvo);
	}


	@Override
	public List<PcrVO> pcrSelectAll(PcrVO pvo) {
		
		return sqlssesion.selectList("pcrSelectAll", pvo);
	}


	@Override
	public List<PcrVO> pcrUpdateForm(PcrVO pvo) {
		// TODO Auto-generated method stub
		return sqlssesion.selectOne("pcrUpdateForm", pvo);
	}


	
	  @Override public List<PcrVO> pcrMain(PcrVO pvo) { 
		  
	   return sqlssesion.selectList("pcrMain", pvo); }


	@Override
	public List<PcrVO> pcrMine(PcrVO pvo) {
		// TODO Auto-generated method stub
		return sqlssesion.selectList("pcrMine", pvo); 
	}
	 
	
}
