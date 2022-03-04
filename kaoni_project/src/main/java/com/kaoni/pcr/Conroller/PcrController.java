package com.kaoni.pcr.Conroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.kaoni.pcr.Service.PcrService;
import com.kaoni.pcr.VO.PcrVO;

@Controller
public class PcrController {
	Logger logger = Logger.getLogger(PcrController.class);
	
	@Autowired(required=false)
	private PcrService pcrService;

	@RequestMapping(value="pcrForm", method=RequestMethod.GET)
	public String pcrForm() {
		logger.info("pcrform 진입");
		return "Pcr/pcrForm";
	}
	@RequestMapping(value="pcrInsert", method=RequestMethod.GET)
	public String pcrInsert(HttpServletRequest req) {
		HttpSession session = req.getSession();
		PcrVO pvo = null;
		pvo = new PcrVO();
		pvo.setEmnum((String)session.getAttribute("emnum"));
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
	@RequestMapping(value="pcrSelectAll", method=RequestMethod.GET)
	public String pcrSelectAll(PcrVO pvo, Model model) {
		//여기는 세션처리가 아니고 조인 이용해야할듯?
		//
		logger.info("contoller select all -------------");
		List<PcrVO> listAll = pcrService.pcrSelectAll(pvo);
		if(listAll.size()>0) {
			model.addAttribute("listAll", listAll);
			return "Pcr/pcrSelectAll";
		}
		logger.info("list 제대로 못가져왔음 확이하셈. ");
		return "Pcr/pcrSelectAll";
	}
	@RequestMapping(value="PcrUpdateForm", method=RequestMethod.GET)
	public String pcrUpdateForm(PcrVO pvo, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		pvo.setEmnum((String)session.getAttribute("emnum"));
		List<PcrVO> list = pcrService.pcrSelectAll(pvo);
		if(list.size()>0) {
			logger.info("list제대로 가져옴");
			model.addAttribute("list", list);
			return "Pcr/pcrUpdateForm";
		}
		logger.info("list 제대로 못가져왔음 확이하셈. ");
		return "Pcr/pcrForm";
		
	}
	
	@RequestMapping(value="pcrUpdate", method=RequestMethod.GET)
	public String pcrUpdate(PcrVO pvo, Model model, HttpServletRequest req) {
		//세션처리 안해도됨 form에서 해줘서 jsp로 넘겨줬기 때문에  
		pvo.setEmnum(req.getParameter("emnum"));
		pvo.setPoutcome(req.getParameter("poutcome"));
		pvo.setIsoleb(req.getParameter("isoleb"));
		pvo.setPcontent(req.getParameter("pcontent"));
		logger.info("emnum-->>"+pvo.getEmnum());	
		int nCnt = pcrService.pcrUpdate(pvo);
		if(nCnt>0) {
			logger.info("update"+nCnt+"건 완료");
		return "Pcr/pcrSelectAll";
	}else {
		return "Pcr/pcrUpdateForm";
	}
	
}
}