package com.kaoni.main.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kaoni.main.VO.MainVO;
import com.kaoni.pcr.VO.PcrVO;


public class MainDAOImpl implements MainDAO {

	@Autowired
	private SqlSessionTemplate sql;
	@Override
	public List<MainVO> pcrdata(MainVO mvo) {
		// TODO Auto-generated method stub
		return sql.selectOne("pcrdata", mvo);

	}
	@Override
	public int pcrdatainsert(MainVO mvo) {
		// TODO Auto-generated method stub
		return sql.insert("pcrdatainsert", mvo);
	}

}
