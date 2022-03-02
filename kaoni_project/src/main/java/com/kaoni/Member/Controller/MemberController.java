package com.kaoni.Member.Controller;


import java.util.List;

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
	
	/*insert 부분에 추가할 코드 
		
	*/
	@ResponseBody
	@RequestMapping(value="memberSelectAll", method=RequestMethod.GET)
	public String memberSelectAll(Model model, MemberVO mvo){
		List<MemberVO> list = memberService.memberSelectAll(mvo);
		model.addAttribute("MemberVO", mvo);
		model.addAttribute("list", list);
		return "member/memberSelectAll";
	}
	
	//회원가입
	@RequestMapping(value="memberSignUp", method=RequestMethod.GET)
	public String memberSignUp(){
		return "member/memberSignUp";
	}
	//회원가입
	@RequestMapping(value="memberSignUp", method=RequestMethod.POST)
	public String memberSignUpSuccess(Model model,MemberVO mvo){
		memberService.memberSignUp(mvo);
		String emnum =ChabunUtil.getMemChabun("EM", chabunService.getMemberChabun().getEmnum());
		mvo.setEmnum(emnum);
		logger.info(emnum);
		return "redirect:/";
	}
	
	
	//회원정보 수정(비밀번호 체크)
//	@RequestMapping(value = "changeInfo",method = RequestMethod.GET)
//	public String changeInfo() {
//		return "member/changeInfo";
//	}
//	
//	@RequestMapping(value = "changeInfo",method = RequestMethod.POST)
//	public String changeInfoPasswdCheck() {
//		return "redirect:/";
//	}
//	
	
	//로그인
	@RequestMapping(value="memberLogin", method=RequestMethod.GET)
	public String memberLogin(){
		logger.info("불러옴");
		return "member/memberLogin";
	}
	
	//로그인
	@RequestMapping(value="memberLogin", method=RequestMethod.POST)
	public String memberLoginSuccess(@RequestParam(name ="id", required = true)String id ,Model model,
			MemberVO mvo, HttpSession session){
		
		memberService.memberLogin(mvo);
		logger.info("로그인 성공");
		
		if(id.equals(mvo.getId())) {
			session.setAttribute(mvo.getId(), "true");
			logger.info("세션성공");
		}else{
			logger.info("실패");
		}
		return "redirect:/";
	}
	
}
