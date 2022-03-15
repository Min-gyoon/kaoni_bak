package com.kaoni.main.Controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kaoni.common.chabun.ChabunUtil;
import com.kaoni.common.chabun.Service.ChabunService;
import com.kaoni.main.Service.MainService;
import com.kaoni.main.VO.MainVO;
import com.kaoni.pcr.Service.PcrService;

@Controller
public class MainController {
	Logger logger = Logger.getLogger(MainController.class);
	
	@Autowired(required=false)
	private MainService mainservice;
	
	@Autowired
	private ChabunService chabunService;
	
	@Autowired
	private PcrService pcrservice;
	
	//String emnum = ChabunUtil.getMemChabun("EM", chabunService.getMemberChabun().getEmnum());
	@ResponseBody
	@RequestMapping(value="pcrdata", method=RequestMethod.GET)
	public String pcrdata(MainVO mvo, Model model) {
		logger.info("welcome pcrdata");
		String mainnum = ChabunUtil.getMainChabun("M", chabunService.getMainChabun().getMainnum());
		logger.info(mainnum);
		MainVO mvoinsert = new MainVO();
		mvoinsert.setMainnum(mainnum);
		int nCnt =mainservice.pcrdatainsert(mvoinsert);
		logger.info(nCnt+"건 추가완료");
		
		List<MainVO> pcrlist = mainservice.pcrdata(mvo);
		mvo = pcrlist.get(0);
		 String json = new Gson().toJson(mvo);
		 
		
		
		if(pcrlist.size()>0) {
			return json;
		}
		logger.info("list 제대로 가져오지 못했음. ");
		return ":/redirect";
	}
	
}
