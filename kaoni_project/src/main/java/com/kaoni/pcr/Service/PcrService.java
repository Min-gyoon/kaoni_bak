package com.kaoni.pcr.Service;

import java.util.List;

import com.kaoni.pcr.VO.PcrVO;

public interface PcrService {
	public int pcrInsert(PcrVO pvo);
	public  int pcrUpdate(PcrVO pvo);
	public List<PcrVO> pcrSelectAll(PcrVO pvo);
	public List<PcrVO> pcrUpdateForm(PcrVO pvo);
	 public List<PcrVO> pcrMain(PcrVO pvo); 
	 public List<PcrVO> pcrMine(PcrVO pvo);
}
