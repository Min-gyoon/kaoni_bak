package com.kaoni.main.Service;

import java.util.List;

import com.kaoni.main.VO.MainVO;
import com.kaoni.pcr.VO.PcrVO;

public interface MainService {
	public List<MainVO> pcrdata(MainVO pvo);
	public int pcrdatainsert(MainVO mvo);
}
