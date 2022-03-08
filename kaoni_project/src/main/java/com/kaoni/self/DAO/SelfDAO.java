package com.kaoni.self.DAO;

import java.util.List;

import com.kaoni.self.VO.SelfVO;

public interface SelfDAO {
public int selfInsert(SelfVO svo);
public List<SelfVO> selfSelectAll(SelfVO svo);
public int updateSelf(SelfVO svo);
}
