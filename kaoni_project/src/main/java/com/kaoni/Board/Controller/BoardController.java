package com.kaoni.Board.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kaoni.Board.Service.BoardService;

@Controller
public class BoardController {

	@Autowired 
	BoardService boardService;
	
	@RequestMapping(value="board", method=RequestMethod.GET)
	public String memberSignUp(){
		return "board/board";
	}
	
	@RequestMapping(value="board1", method=RequestMethod.POST)
	public String memberSignUp1(){
		return "board/board";
	}
}
