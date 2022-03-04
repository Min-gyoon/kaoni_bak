package com.kaoni.pcr.DAO;

import java.util.List;

import com.kaoni.pcr.VO.PcrVO;

public interface PcrDAO {

	public List<PcrVO> pcrUpdateForm(PcrVO pvo);
	public int pcrUpdate(PcrVO pvo);
	public int pcrInsert(PcrVO pvo);
	public List<PcrVO> pcrSelectAll(PcrVO pvo);
	
}
