package com.kaoni.Member.Controller;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	 private static String RSA_WEB_KEY = "_RSA_WEB_Key_"; // 개인키 session key
     private static String RSA_INSTANCE = "RSA"; // rsa transformation
	
//	회원가입	
	@RequestMapping(value="memberSignUp", method=RequestMethod.GET)
	public String memberSignUp(){
		return "member/memberSignUp";
	}
	
	@RequestMapping(value="memberSignUp1", method=RequestMethod.POST)
	public String memberSignUpSuccess(@Valid MemberVO mvo, BindingResult result,HttpServletRequest request
			,Model model){
		System.out.println("BindingResult : "+ result);
		
		// 에러를 List로 저장
		List<ObjectError> list = result.getAllErrors();
				
		int idCheck = memberService.idCheck(mvo);
		if(idCheck == 1) {
			return "redirect:memberSignUp.kaoni";
		}else if (idCheck ==0) {
			if(result.hasErrors()) {
				for( ObjectError error : list ) {
					System.out.println(error);
					logger.info(error);
				}
				return "member/memberSignUp";
			}else {
				
				String emnum = ChabunUtil.getMemChabun("EM", chabunService.getMemberChabun().getEmnum());
				mvo.setEmnum(emnum);
				memberService.memberSignUp(mvo);
				return "sucsessSingUp";
				}

		}
		return "redirect:/";
	}
	
//	로그인, 세션
	@RequestMapping(value="memberLogin", method=RequestMethod.GET)
	public String memberLogin(HttpServletRequest request, HttpServletResponse response) throws Exception,NoSuchAlgorithmException{
		// RSA 키 생성
        initRsa(request);
		return "member/memberLogin";
	}
	
	@RequestMapping(value="memberLogin1", method=RequestMethod.POST)
	public String memberLoginSuccess(HttpServletRequest request, MemberVO mvo) throws Exception{
		
		String userId = (String) request.getParameter("USER_ID");
	    String userPw = (String) request.getParameter("USER_PW");
	    
	    logger.info("암호화 id : "+userId);
	    logger.info("복호화 pw : "+userPw);
	    
		HttpSession session = request.getSession();	
		// 세션에 저장된 개인키를 불러온다. 
		PrivateKey privateKey = (PrivateKey) session.getAttribute(MemberController.RSA_WEB_KEY);
     
		 // 복호화
		userId = decryptRsa(privateKey, userId);
	    userPw = decryptRsa(privateKey, userPw);
 
	    logger.info("암호화 id : "+userId);
	    logger.info("복호화 pw : "+userPw);
	    
	    // 개인키 삭제
        session.removeAttribute(MemberController.RSA_WEB_KEY);
        
        mvo.setId(userId);
        mvo.setPasswd(userPw);
		MemberVO memberVO = memberService.memberLogin(mvo);
		
		if(memberVO == null) {
			session.setAttribute("emnum", null);
			session.setAttribute("member", null);
			session.setAttribute("passwd", null);
			return "needlogin2";
		}else {
			session.setAttribute("emnum", memberVO.getEmnum());
			session.setAttribute("member", memberVO.getId());
			session.setAttribute("passwd", memberVO.getPasswd());
			return "redirect:/";
		}   
		}	
	
//	회원정보 수정 전 비밀번호 체크
	@RequestMapping(value = "updateInfo_pwCheck",method = RequestMethod.GET)
	public String changeInfo_pwCheck() {
		return "member/updateInfo_pwCheck";
	}
	@RequestMapping(value = "updateInfo_pwCheck1",method = RequestMethod.POST)
	public String changeInfoPasswdCheck(MemberVO mvo,HttpServletRequest request) {
		
		HttpSession session = request.getSession(true);
		MemberVO memberVO = new MemberVO(); 
		
		//pwcheck에서 받아온 값
		memberVO.setId(request.getParameter("id"));
		memberVO.setPasswd(request.getParameter("passwd"));
		memberVO.setEmnum((String) session.getAttribute("emnum"));
		
		//세션으로 가져온 값
		mvo.setId((String)session.getAttribute("member"));
		mvo.setPasswd((String)session.getAttribute("passwd"));
		mvo.setEmnum((String) session.getAttribute("emnum"));
		memberService.memberLogin(memberVO);
		memberService.memberLogin(mvo);
		
		if(memberVO.getPasswd().equals(mvo.getPasswd())) {
			return "redirect:/updateInfo.kaoni";
		}else{
		return "needlogin3";
		}
	}

	//	회원정보 수정 창
	@RequestMapping(value = "updateInfo",method = RequestMethod.GET)
	public String updateInfo(MemberVO mvo, Model model, HttpServletRequest req) {
		logger.info("updateinfo 진입");
		
		HttpSession session = req.getSession();
		
		String checklogin = (String)session.getAttribute("emnum");
		if(checklogin.equals("EM0000")) {
			mvo.setEmnum(req.getParameter("emnum"));
		}else {
			mvo.setEmnum(checklogin);
		}
		//if(checklogin.equals("admin")) {
		//}else {return "404";}
		
		List<MemberVO> list = memberService.memberUpdateForm(mvo);
		model.addAttribute("list", list);
		
		return "member/updateInfo";
	}
	
	@RequestMapping(value = "updateInfo2",method = RequestMethod.POST)
	public String updateInfo1( MemberVO mvo, HttpServletRequest request, HttpSession session) {
		mvo.setName(request.getParameter("name"));
		mvo.setDname(request.getParameter("dname"));
		mvo.setPosition(request.getParameter("position"));
		mvo.setId(request.getParameter("id"));
		mvo.setPasswd(request.getParameter("passwd"));
		mvo.setEmnum(request.getParameter("emnum"));
		mvo.setDeleteyn(request.getParameter("deleteyn"));
		memberService.updateInfo(mvo);
		logger.info("emnum : "+request.getParameter("emnum"));
		
		session = request.getSession();
		session.invalidate();
		
		return "sucsessUpdateInfo";
	}
	

	@RequestMapping(value = "logOut", method = RequestMethod.GET)
	public String logOut(HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	public int idCheck(MemberVO mvo,HttpServletRequest request,String id2) {
		int result = memberService.idCheck(mvo);
		return result;
	}
		
		private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
	        Cipher cipher = Cipher.getInstance(MemberController.RSA_INSTANCE);
	        byte[] encryptedBytes = hexToByteArray(securedValue);
	        cipher.init(Cipher.DECRYPT_MODE, privateKey);
	        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
	        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
	        return decryptedValue;
	    }
	    
	    /**
	     * 16진 문자열을 byte 배열로 변환한다.
	     * 
	     * @param hex
	     * @return
	     */
	    public static byte[] hexToByteArray(String hex) {
	        if (hex == null || hex.length() % 2 != 0) { return new byte[] {}; }
	 
	        byte[] bytes = new byte[hex.length() / 2];
	        for (int i = 0; i < hex.length(); i += 2) {
	            byte value = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
	            bytes[(int) Math.floor(i / 2)] = value;
	        }
	        return bytes;
	    }
	    
	    public void initRsa(HttpServletRequest request) {
	        HttpSession session = request.getSession();
	 
	        KeyPairGenerator generator;
	        try {
	            generator = KeyPairGenerator.getInstance(MemberController.RSA_INSTANCE);
	            generator.initialize(2048);
	            
	            KeyPair keyPair = generator.genKeyPair();
	            KeyFactory keyFactory = KeyFactory.getInstance(MemberController.RSA_INSTANCE);
	            PublicKey publicKey = keyPair.getPublic();
	            PrivateKey privateKey = keyPair.getPrivate();
	            
	            logger.info("publicKey : "+publicKey);
	            logger.info("privateKey : "+privateKey);
	            
	            session.setAttribute(MemberController.RSA_WEB_KEY, privateKey); // session에 RSA 개인키를 세션에 저장
	 
	            RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
	            //공개키 및 개인키의 N 값
	            String publicKeyModulus = publicSpec.getModulus().toString(16);
	            //공개키 및 개인키의 E 값
	            String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
	 
	            logger.info("publicKeyModulus(공개키 및 개인키의 N 값) : "+publicKeyModulus);
	            logger.info("publicKeyExponent(공개키 및 개인키의 E 값) : "+publicKeyExponent);
	            
	            request.setAttribute("RSAModulus", publicKeyModulus); // rsa modulus 를 request 에 추가
	            request.setAttribute("RSAExponent", publicKeyExponent); // rsa exponent 를 request 에 추가
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	    }



	    
}
