package com.kaoni.Board.Controller;


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
import com.kaoni.Board.VO.BoardVO;

import oracle.jdbc.logging.annotations.Log;

@Controller
public class BoardController {

	Logger l = Logger.getLogger(BoardController.class);
	
	@Autowired 
	private BoardService boardService;

//	게시글 전체 목록
	@RequestMapping(value="ShowAllBoard", method=RequestMethod.GET)
	public String ShowAllBoard(BoardVO bvo, Model model){
		List<BoardVO> list = boardService.ShowAllPost(bvo);
		model.addAttribute("list", list);
		return "board/ShowAllPost";
	}
	
	@RequestMapping(value="ShowAllBoard1", method=RequestMethod.POST)
	public String ShowAllBoard1(){
		return "board/ShowAllPost";
	}

//	게시글 작성
	@RequestMapping(value="writePost", method=RequestMethod.GET)
	public String memberSignUp(){
		return "board/writePost";
	}
	
	@RequestMapping(value="writePost1", method=RequestMethod.POST)
	public String memberSignUp1(HttpServletRequest request,HttpSession session,BoardVO bvo){
		session = request.getSession();
		String emnum = (String) session.getAttribute("emnum");
		String summernote = request.getParameter("summernote");
		String content = summernote.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "").replaceAll("\r|\n|&nbsp;","");
		bvo.setEmnum(emnum);
		bvo.setContent(content);
		boardService.WritePost(bvo);
		
		l.info(bvo.getTitle());
		l.info(bvo.getImpor());
		l.info(bvo.getRegdate());
		l.info(summernote);
		l.info(bvo.getContent());
		
		return "board/writePost";
	}
	
	
}	


