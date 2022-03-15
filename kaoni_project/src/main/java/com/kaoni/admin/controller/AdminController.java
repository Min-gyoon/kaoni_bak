package com.kaoni.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kaoni.Board.Service.BoardService;
import com.kaoni.Member.Service.MemberService;
import com.kaoni.Member.VO.MemberVO;
import com.kaoni.pcr.Service.PcrService;
import com.kaoni.pcr.VO.PcrVO;

@Controller
public class AdminController {
	private Logger logger = Logger.getLogger(AdminController.class);
	
	@Autowired 
	private BoardService boardservice;
	@Autowired 
	private PcrService pcrservice;
	@Autowired
	private MemberService memberservice;
	
	//결국엔 admin 전용 selectall
	@RequestMapping(value="adminmain", method=RequestMethod.GET)
	public String adminmain(HttpServletRequest req, Model model, PcrVO pvo) {
		logger.info("adminmain 진입");
		HttpSession session = req.getSession();
		String checklogin = (String)session.getAttribute("emnum");
		logger.info(checklogin);
		if(checklogin.equals("00")) {
		}else {return "404";}
		List<PcrVO> listAll = pcrservice.pcrSelectAll(pvo);
		model.addAttribute("listAll", listAll);
		logger.info("listsize-->"+listAll.size());
		if(listAll.size() > 0) {
			return "admin/adminmain";
		}else{return "404띄우자 ";}
	
}

	@RequestMapping(value="adminPcrSelect", method=RequestMethod.GET)
	public String adminPcrSelect(PcrVO pvo, Model model, HttpServletRequest req) {
		pvo.setEmnum(req.getParameter("emnum"));
		logger.info(req.getParameter("emnum"));
		List<PcrVO> list = pcrservice.pcrUpdateForm(pvo);
		if(list.size()>0) {
			logger.info("list.size()->>>"+list.size());
			model.addAttribute("list", list);
			return "Pcr/pcrUpdateForm";
		}
		logger.info("admin select 오류 발생");
		return "needlogin";		
	}
	@RequestMapping(value="adminMemberlist", method=RequestMethod.GET)
	public String adminMemberlist(MemberVO mvo, Model model, HttpServletRequest req) {
		logger.info("adminMemberlist 진입");
		HttpSession session = req.getSession();
		String checklogin = (String)session.getAttribute("emnum");
		logger.info(checklogin);
		if(checklogin.equals("00")) {
		}else {return "404";}
		List<MemberVO> list = memberservice.memberSelectAll(mvo);
		model.addAttribute("list", list);
		if(list.size()>0) {
			return "admin/adminmember";
		}return "404띄우자 ";

}
	@RequestMapping(value="adminMemberSelect", method=RequestMethod.GET)
	public String adminMemberSelect(MemberVO mvo, Model model, HttpServletRequest req) {
	mvo.setEmnum(req.getParameter("emnum"));
	logger.info(req.getParameter("emnum"));
	//쿼리 where절에 emnum
	List<MemberVO> list = memberservice.memberUpdateForm(mvo);

	if(list.size()>0) {
		logger.info("list.size()->>>"+list.size());
		model.addAttribute("list", list);
		return "member/updateInfo";
	}
	logger.info("admin select 오류 발생");
	return "404띄우자";		
}
	//BOARD추가할것. 
	
}
	
	
	
	


