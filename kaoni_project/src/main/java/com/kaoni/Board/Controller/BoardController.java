package com.kaoni.Board.Controller;


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
import com.kaoni.Board.VO.Criteria;
import com.kaoni.Board.VO.PageMaker;

@Controller
public class BoardController {

	Logger l = Logger.getLogger(BoardController.class);
	
	@Autowired 
	private BoardService boardService;

//	게시글 전체 목록
	@RequestMapping(value="ShowAllPost", method=RequestMethod.GET)
	public String ShowAllPost(BoardVO bvo, Model model,Criteria cri){
		model.addAttribute("list", boardService.ShowAllPost(cri));
		l.info(cri.getRowStart());
		l.info(cri.getRowEnd());
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/ShowAllPost";
	}

//	게시글 작성
	@RequestMapping(value="writePost", method=RequestMethod.GET)
	public String WritePost(){
		return "board/writePost";
	}
	
	@RequestMapping(value="writePost1", method=RequestMethod.POST)
	public String WritePost1(HttpServletRequest request,HttpSession session,BoardVO bvo){
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
	
	
//	게시글 수정
	@RequestMapping(value="UpdatePost", method=RequestMethod.GET)
	public String UpdatePost(Model model,String nbo){
		BoardVO data = boardService.DetailPost(Integer.parseInt(nbo));
		model.addAttribute("data",data);
		l.info("수정");
		l.info(data.getNbo());
		l.info(data.getTitle());
		return "board/UpdatePost";
		
	}
	
	@RequestMapping(value="UpdatePost1", method=RequestMethod.POST)
	public String UpdatePost1(BoardVO bvo,HttpServletRequest request){
		String summernote = request.getParameter("summernote");
		String content = summernote.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "").replaceAll("\r|\n|&nbsp;","");
		
		bvo.setTitle(request.getParameter("title"));
		bvo.setContent(content);
		bvo.setImpor(Integer.parseInt(request.getParameter("impor")));
		bvo.setUpdatedate(request.getParameter("updatedate"));
		boardService.UpdatePost(bvo);
		
		return "board/UpdatePost";
	}
	
	//	게시글 삭제
	@RequestMapping(value="DeletePost", method=RequestMethod.GET)
	public String DeletePost(Model model, String nbo,HttpServletRequest request,BoardVO bvo){
		l.info("nbo 번호 : "+nbo);
		bvo.setNbo(Integer.parseInt(nbo));
		boardService.DeletePost(bvo);
		l.info("삭제완료");
		return "redirect:/";
	}
	
	//게시글 상세보기
	@RequestMapping(value="DetailPost", method=RequestMethod.GET)
	public String DetailPost(Model model, String nbo,HttpServletRequest request,BoardVO bvo){
		l.info("nbo Value : "+nbo);
		BoardVO data = boardService.DetailPost(Integer.parseInt(nbo));
		model.addAttribute("data",data);
		return "board/DetailPost";
	}
}	


