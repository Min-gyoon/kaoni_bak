package com.kaoni.Member.Controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaoni.Member.Service.MemberService;
import com.kaoni.Member.VO.MemberVO;
import com.kaoni.common.chabun.Service.ChabunService;

@Controller
public class MemberController {
	
	Logger logger = Logger.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	private ChabunService chabunService;
	
	/*insert 부분에 추가할 코드 
		String emnum =ChabunUtil.getMemChabun("EM", chabunService.getMemberChabun().getemnum());
		mvo.setEmnum(emnum);
	*/
	
	
	@RequestMapping(value="test", method=RequestMethod.GET)
	public String Test() {
		logger.info("test info");
		
		return "test";
	}
	@ResponseBody
	@RequestMapping(value="memberSelectAll", method=RequestMethod.GET)
	public String memberSelectAll(Model model, MemberVO mvo){
		
		List<MemberVO> list = memberService.memberSelectAll(mvo);
		model.addAttribute("MemberVO", mvo);
		model.addAttribute("list", list);
		return "memberSelectAll";
	}
	
	
	
}
