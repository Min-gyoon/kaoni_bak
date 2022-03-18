package com.kaoni.self.Controller;

import java.util.ArrayList;
import java.util.List;
import javax.validation.constraints.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kaoni.pcr.VO.PcrVO;
import com.kaoni.self.Service.SelfService;
import com.kaoni.self.VO.SelfVO;

@Controller
public class SelfController {

	Logger logger = Logger.getLogger(SelfController.class);
	@Autowired
	private SelfService selfservice;
	
	@RequestMapping(value="selfForm")
	public String selfForm(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String checklogin = (String)session.getAttribute("emnum");
		if(checklogin==null) {
			return "needlogin";
		}
		return "self/selfForm";
	}
	
	
	@RequestMapping(value="selfInsert") 
	public String selfInsert(HttpServletRequest request) { 
	SelfVO svo = new SelfVO(); 
	 
	HttpSession session = request.getSession(); 
	String checklogin = (String)session.getAttribute("emnum"); 
	if(checklogin==null) { 
	return "needlogin"; 
	} 
	svo.setEmnum(checklogin); 
	ArrayList<String> list = new ArrayList<>(); 
	 
	String s1 = request.getParameter("Selfcheck1"); 
	String s2 = request.getParameter("Selfcheck2"); 
	String s3 = request.getParameter("Selfcheck3"); 
	String s4 = request.getParameter("Selfcheck4"); 
	String s5 = request.getParameter("Selfcheck5"); 
	String s6 = request.getParameter("Selfcheck6"); 
	 
	list.add(s1); 
	list.add(s2); 
	list.add(s3); 
	list.add(s4); 
	list.add(s5); 
	list.add(s6); 
	 
	int sCnt = 0; 
	for(int i =0; i<list.size(); i++) { 
	String count = (String) list.get(i); 
	if(count.equals("Y")) { 
	sCnt++; 
	} 
	} 
	 
	svo.setSelfcheck1(s1); 
	svo.setSelfcheck2(s2); 
	svo.setSelfcheck3(s3); 
	svo.setSelfcheck4(s4); 
	svo.setSelfcheck5(s5); 
	svo.setSelfcheck6(s6); 
	svo.setscnt(Integer.toString(sCnt)); 
	int nCnt = selfservice.selfInsert(svo); 
	 
	if(sCnt>3) { 
	//return "self/warning"; 
	return "self/selfResult"; 
	} 
	 
	 
	if(nCnt > 0) { 
	return "redirect:/"; 
	}else { 
	return "self/selfForm"; 
	}}

	@RequestMapping(value="selfSelectAll")
	public String selfSelectAll(HttpServletRequest request, Model model, SelfVO svo) {
		//세션처리할것
		HttpSession session = request.getSession();
		String checklogin = (String)session.getAttribute("emnum");
		if(checklogin==null) {
			return "needlogin";
		}
		svo.setEmnum(checklogin);
		List<SelfVO> listAll = selfservice.selfSelectAll(svo);
		
		model.addAttribute("listAll", listAll);
		if(listAll.size()>0) {
			return "self/selfSelectAll";
		}else {	
			return "error";}
	
}

}