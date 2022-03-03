package com.kaoni.Member.Controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaoni.Member.Service.MemberService;
import com.kaoni.Member.VO.MemberVO;
import com.kaoni.common.chabun.ChabunUtil;
import com.kaoni.common.chabun.Service.ChabunService;

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
		
		//int age = Integer.parseInt(request.getParameter("age"));
		String emnum = ChabunUtil.getMemChabun("EM", chabunService.getMemberChabun().getEmnum());
		MemberVO mvo = new MemberVO();
		mvo.setEmnum(emnum);
		//mvo.setAge(age);
		mvo.setGender(request.getParameter("gender"));
		mvo.setPasswd(request.getParameter("passwd"));
		mvo.setId(request.getParameter("id"));
		mvo.setPosition(request.getParameter("position"));
		mvo.setName(request.getParameter("name"));
		memberService.memberSignUp(mvo);
		logger.info(emnum);
		
		return "redirect:/";
	}
	
	
//	회원정보 수정 전 비밀번호 체크
	@RequestMapping(value = "updateInfo_pwCheck",method = RequestMethod.GET)
	public String changeInfo_pwCheck() {
		return "member/updateInfo_pwCheck";
	}
	
	@RequestMapping(value = "updateInfo_pwCheck",method = RequestMethod.POST)
	public String changeInfoPasswdCheck() {
		return "member/updateInfo_pwCheck";
	}
	
	
//	회원정보 수정 창
	@RequestMapping(value = "updateInfo",method = RequestMethod.GET)
	public String updateInfo() {
		return "member/updateInfo";
	}
	
	@RequestMapping(value = "updateInfo2",method = RequestMethod.POST)
	public String updateInfo1(HttpServletRequest request,MemberVO mvo,HttpSession session) {
		mvo.setPosition(request.getParameter("position"));
		mvo.setPasswd(request.getParameter("passwd"));
		mvo.getId();
		
		memberService.updateInfo(mvo);
		return "redirect:/";
	}
	
	
//	로그인
	@RequestMapping(value="memberLogin", method=RequestMethod.GET)
	public String memberLogin(){
		return "member/memberLogin";
	}
	
	@RequestMapping(value="memberLogin1", method=RequestMethod.POST)
	public String memberLoginSuccess(@RequestParam(name ="id", required = true)String id,Model model,
			MemberVO mvo, HttpSession session, HttpServletRequest request){
		
		session = request.getSession();
		memberService.memberLogin(mvo);
		
		if(id.equals(mvo.getId())) {
			session.setAttribute("id", id);
			
//			logger.info("id = "+id);
//			logger.info("mvo.id list = "+mvo.getId());
		}else{
			logger.info("실패");
		}
		return "redirect:/";
	}
	
}
