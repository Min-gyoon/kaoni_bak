package com.kaoni.main.DAO;

import java.util.List;

import com.kaoni.main.VO.MainVO;


public interface MainDAO {
	public List<MainVO> pcrdata(MainVO mvo);
	public int pcrdatainsert(MainVO mvo);
}
