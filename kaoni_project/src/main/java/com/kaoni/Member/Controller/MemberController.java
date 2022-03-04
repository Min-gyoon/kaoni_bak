package com.kaoni.Member.Controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kaoni.Member.Service.MemberService;
import com.kaoni.Member.VO.MemberVO;
import com.kaoni.common.chabun.ChabunUtil;
import com.kaoni.common.chabun.Service.ChabunService;

import oracle.jdbc.logging.annotations.Log;

@Controller
public class MemberController {
	
	Logger logger = Logger.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private ChabunService chabunService;
	
//	회원가입
	@RequestMapping(value="memberSignUp1", method=RequestMethod.GET)
	public String memberSignUp(){
		return "member/memberSignUp";
	}
	
	@RequestMapping(value="memberSignUp2", method=RequestMethod.POST)
	public String memberSignUpSuccess(Model model,HttpServletRequest request){
		
		String emnum = ChabunUtil.getMemChabun("EM", chabunService.getMemberChabun().getEmnum());
		MemberVO mvo = new MemberVO();
		mvo.setEmnum(emnum);
		mvo.setName(request.getParameter("name"));
		mvo.setPosition(request.getParameter("position"));
		mvo.setId(request.getParameter("id"));
		mvo.setPasswd(request.getParameter("passwd"));
		mvo.setGender(request.getParameter("gender"));
		mvo.setDname(request.getParameter("Dname"));
		
		memberService.memberSignUp(mvo);
		logger.info(emnum);
		
		return "redirect:/";
	}
	
	
//	회원정보 수정 전 비밀번호 체크
	@RequestMapping(value = "updateInfo_pwCheck",method = RequestMethod.GET)
	public String changeInfo_pwCheck() {
		return "member/updateInfo_pwCheck";
	}
	
	@RequestMapping(value = "updateInfo_pwCheck2",method = RequestMethod.POST)
	public String changeInfoPasswdCheck(MemberVO mvo,HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = new MemberVO();
			
		String passwd = request.getParameter("passwd");
		memberVO.setId((String)session.getAttribute("member"));
		memberVO.setPasswd(passwd);
		memberService.memberLogin(mvo);
		
		if(passwd != memberVO.getPasswd()) {
			logger.info(passwd);
			logger.info(memberVO.getPasswd());
			return "redirect:/";
		}else {
			logger.info(passwd);
			logger.info(memberVO.getPasswd());
		return "member/updateInfo";}
	}
	
	
//	회원정보 수정 창
	@RequestMapping(value = "updateInfo",method = RequestMethod.GET)
	public String updateInfo() {
		return "member/updateInfo";
	}
	
	@RequestMapping(value = "updateInfo2",method = RequestMethod.POST)
	public String updateInfo1(HttpServletRequest request,MemberVO mvo, HttpSession session) {
		mvo.setPosition(request.getParameter("position"));
		mvo.setPasswd(request.getParameter("passwd"));
		mvo.getId();
		
		memberService.updateInfo(mvo);
		return "redirect:/";
	}
	
//	로그인, 세션
	@RequestMapping(value="memberLogin", method=RequestMethod.GET)
	public String memberLogin(){
		return "member/memberLogin";
	}
	
	@RequestMapping(value="memberLogin1", method=RequestMethod.POST)
	public String memberLoginSuccess(HttpServletRequest request, MemberVO mvo){
		
		HttpSession session = request.getSession();	
		MemberVO memberVO = memberService.memberLogin(mvo);
		
		if(memberVO == null) {
			session.setAttribute("member", null);
			return "redirect:/";
		}else {
			session.setAttribute("member", memberVO.getId());
			return "redirect:/";
		}
		}
	
}
