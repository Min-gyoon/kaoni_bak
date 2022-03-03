package com.kaoni.pcr.DAO;

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
	
}
