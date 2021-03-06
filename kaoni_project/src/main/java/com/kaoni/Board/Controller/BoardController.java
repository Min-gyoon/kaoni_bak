package com.kaoni.Board.Controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kaoni.Board.Service.BoardService;
import com.kaoni.Board.VO.BoardVO;
import com.kaoni.Board.VO.Criteria;
import com.kaoni.Board.VO.PageMaker;

@Controller
public class BoardController {

	Logger l = Logger.getLogger(BoardController.class);
	
	@Autowired 
	private BoardService boardService;

	@ResponseBody
	@RequestMapping(value = "ShowMainPost", method = RequestMethod.GET)
	public String ShowMainPost(BoardVO bvo,Model model) {
		l.info("ShowMainPost");
		List<BoardVO> list = boardService.ShowMainPost(bvo);
		String jsontest = new Gson().toJson(list);  
	
		l.info("ShowMainPost 전달 : "+jsontest);
		  
		if(list.size()>0) {  
		return jsontest;  
		}  
		return "error";  
		}  
	
//	게시글 전체 목록
	@RequestMapping(value="ShowAllPost", method=RequestMethod.GET)
	public String ShowAllPost(BoardVO bvo, Model model,Criteria cri){
		model.addAttribute("list", boardService.ShowAllPost(bvo));
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(cri);
//		pageMaker.setTotalCount(boardService.listCount());
//		
//		model.addAttribute("pageMaker", pageMaker);
		
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
		Date now = new Date();
		 
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String today = sf.format(now);
		 
		String emnum = (String) session.getAttribute("emnum");
		String summernote = request.getParameter("summernote");
		String content = summernote.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "").replaceAll("\r|\n|&nbsp;","");
		
		bvo.setRegdate(today);
		bvo.setUpdatedate(today);
		bvo.setEmnum(emnum);
		bvo.setContent(content);
		boardService.WritePost(bvo);
		
		return "redirect:ShowAllPost.kaoni";
	}
	
	
//	게시글 수정
	@RequestMapping(value="UpdatePost", method=RequestMethod.GET)
	public String UpdatePost(Model model,String nbo){
		BoardVO data = boardService.DetailPost(Integer.parseInt(nbo));
		model.addAttribute("data",data);
		return "board/UpdatePost";
		
	}
	
	@RequestMapping(value="UpdatePost1", method=RequestMethod.POST)
	public String UpdatePost1(BoardVO bvo,HttpServletRequest request){
		Date now = new Date();
		
		String summernote = request.getParameter("summernote");
		String content = summernote.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "").replaceAll("\r|\n|&nbsp;","");
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String today = sf.format(now);
		
		bvo.setNbo(Integer.parseInt(request.getParameter("nbo")));
		bvo.setTitle(request.getParameter("title"));
		bvo.setContent(content);
		bvo.setImpor(Integer.parseInt(request.getParameter("impor")));
		bvo.setUpdatedate(today);
		boardService.UpdatePost(bvo);
		
		return "redirect:ShowAllPost.kaoni";
	}
	
	//	게시글 삭제
	@RequestMapping(value="DeletePost", method=RequestMethod.GET)
	public String DeletePost(Model model, String nbo,HttpServletRequest request,BoardVO bvo){
		bvo.setNbo(Integer.parseInt(nbo));
		boardService.DeletePost(bvo);
		return "redirect:ShowAllPost.kaoni";
	}
	
	//게시글 상세보기
	@RequestMapping(value="DetailPost", method=RequestMethod.GET)
	public String DetailPost(Model model, String nbo,HttpServletRequest request,BoardVO bvo){
		BoardVO data = boardService.DetailPost(Integer.parseInt(nbo));
		model.addAttribute("data",data);
		return "board/DetailPost";
	}
}	


