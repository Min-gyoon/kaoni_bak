package com.kaoni.pcr.Conroller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kaoni.pcr.Service.PcrService;
import com.kaoni.pcr.VO.PcrVO;

@Controller
public class PcrController {
	Logger logger = Logger.getLogger(PcrController.class);
	
	@Autowired(required=false)
	private PcrService pcrService;
	
	/*
	@Autowired
	PcrController(PcrService pcrService){
		this.pcrService=pcrService;
	}*/
	
	@RequestMapping(value="pcrForm", method=RequestMethod.GET)
	public String pcrForm() {
		logger.info("pcrform 진입");
		return "Pcr/pcrForm";
	}
	@RequestMapping(value="pcrInsert", method=RequestMethod.GET)
	public String pcrInsert(HttpServletRequest req) {
		
		String emnum = "0";
		PcrVO pvo = null;
		pvo = new PcrVO();
		pvo.setEmnum(emnum);
		pvo.setIsolea(req.getParameter("isolea"));
		pvo.setIsoleb(req.getParameter("isoleb"));
		pvo.setPoutcome(req.getParameter("poutcome"));
		pvo.setPcontent(req.getParameter("pcontent"));
		int nCnt = pcrService.pcrInsert(pvo);
		logger.info("ncnt-->>"+nCnt);
		req.setAttribute("nCnt", nCnt);
		if(nCnt>0) {return "Pcr/pcrInsert";}	 
		else {return "Pcr/pcrForm";}
	}
	@RequestMapping(value="PcrUpdate", method=RequestMethod.GET)
	public String pcrUpdate(HttpServletRequest req) {
		
		return "Pcr/pcrUpdate";
	}
	
	
	
	
}
