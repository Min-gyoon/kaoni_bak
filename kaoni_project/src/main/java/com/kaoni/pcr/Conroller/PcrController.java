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

import com.kaoni.Member.VO.MemberVO;
import com.kaoni.pcr.Service.PcrService;
import com.kaoni.pcr.VO.PcrVO;

@Controller
public class PcrController {
	Logger logger = Logger.getLogger(PcrController.class);
	
	@Autowired(required=false)
	private PcrService pcrService;

	@RequestMapping(value="pcrForm", method=RequestMethod.GET)
	public String pcrForm(HttpServletRequest req) {
		logger.info("pcrform 진입");
		HttpSession session = req.getSession();
		String checklogin = (String)session.getAttribute("emnum");
		if(checklogin==null) {
			return "needlogin";
		}
		
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
		pvo.setDeleteyn("Y");
		int nCnt = pcrService.pcrInsert(pvo);
		logger.info("ncnt-->>"+nCnt);
		req.setAttribute("nCnt", nCnt);
		if(nCnt>0) {return "redirect:/";}	 
		else {return "Pcr/pcrForm";}
	}
	@RequestMapping(value="pcrSelectAll", method=RequestMethod.GET)
	public String pcrSelectAll(PcrVO pvo, Model model) {
		logger.info("contoller select all -------------");
		int pageSize = 10;
		int groupSize = 5;
		int curPage = 1;
		int totalCount = 0; 
		pvo.setCurPage(String.valueOf(curPage));
		pvo.setGroupSize(String.valueOf(groupSize));
		pvo.setPageSize(String.valueOf(pageSize));
		pvo.setTotalCount(String.valueOf(totalCount));
		List<PcrVO> listAll = pcrService.pcrSelectAll(pvo);
		logger.info(pvo.getCurPage());
		logger.info(pvo.getGroupSize());
		if(listAll.size()>0) {
			model.addAttribute("pagingVO", pvo);
			model.addAttribute("listAll", listAll);
			return "Pcr/pcrSelectAll";
		}
		logger.info("list 제대로 가져오지 못했음. ");
		return "Pcr/pcrSelectAll";
	}
	@RequestMapping(value="PcrUpdateForm", method=RequestMethod.GET)
	public String pcrUpdateForm(PcrVO pvo, Model model, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		String checklogin = (String)session.getAttribute("emnum");
		pvo.setEmnum(checklogin);
		List<PcrVO> list = pcrService.pcrUpdateForm(pvo);
		if(list.size()>0) {
			logger.info("list.size()->>>"+list.size());
			model.addAttribute("list", list);
			return "Pcr/pcrUpdateForm";
		}
		logger.info("list 제대로 못가져왔음 확이하셈. ");
		return "needlogin";		
	}

	@RequestMapping(value="pcrUpdate", method=RequestMethod.GET)
	public String pcrUpdate(PcrVO pvo, Model model, HttpServletRequest req) {
		logger.info(req.getParameter("emnum"));
		pvo.setEmnum(req.getParameter("emnum"));
		pvo.setPoutcome(req.getParameter("poutcome"));
		pvo.setIsoleb(req.getParameter("isoleb"));
		pvo.setPcontent(req.getParameter("pcontent"));
		pvo.setDeleteyn(req.getParameter("deleteyn"));
		logger.info("emnum-->>"+pvo.getEmnum());	
		int nCnt = pcrService.pcrUpdate(pvo);
		if(nCnt>0) {
			logger.info("update"+nCnt+"건 완료");
		return "redirect:/";
	}else {
		return "Pcr/pcrUpdateForm";
	}
	
}
}