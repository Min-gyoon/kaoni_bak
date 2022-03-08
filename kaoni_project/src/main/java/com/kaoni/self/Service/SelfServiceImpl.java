package com.kaoni.self.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaoni.self.DAO.SelfDAO;
import com.kaoni.self.VO.SelfVO;

@Transactional
@Service
public class SelfServiceImpl implements SelfService {

	@Autowired
	private SelfDAO selfdao;
	
	@Override
	public int selfInsert(SelfVO svo) {
		// TODO Auto-generated method stub
		return selfdao.selfInsert(svo);
	}

	
	@Override
	public int updateSelf(SelfVO svo) {
		// TODO Auto-generated method stub
		return selfdao.updateSelf(svo);
	}


	@Override
	public List<SelfVO> selfSelectAll(SelfVO svo) {
		// TODO Auto-generated method stub
		return selfdao.selfSelectAll(svo);
	}

}
