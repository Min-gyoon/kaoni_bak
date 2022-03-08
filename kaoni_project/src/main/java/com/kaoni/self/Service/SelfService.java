package com.kaoni.self.Service;

import java.util.List;

import com.kaoni.self.VO.SelfVO;

public interface SelfService {
		public int selfInsert(SelfVO svo);
		public List<SelfVO> selfSelectAll(SelfVO svo);
		public int updateSelf(SelfVO svo);
		
}
