package com.kaoni.self.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.kaoni.self.VO.SelfVO;


public class SelfDAOImpl implements SelfDAO {

	@Autowired
	private SqlSessionTemplate sqlTemplate;
	@Override
	public int selfInsert(SelfVO svo) {
		// TODO Auto-generated method stub
		return sqlTemplate.insert("selfInsert", svo);
	}
	@Override
	public int updateSelf(SelfVO svo) {
		// TODO Auto-generated method stub
		return sqlTemplate.update("updateSelf", svo);
	}

	@Override
	public List<SelfVO> selfSelectAll(SelfVO svo) {
		// TODO Auto-generated method stub
		return sqlTemplate.selectList("selfSelectAll", svo);
	}

}
