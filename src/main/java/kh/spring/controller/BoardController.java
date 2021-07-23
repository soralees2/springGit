package kh.spring.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dao.BoardDAO;
import kh.spring.dto.BoardDTO;


@Controller
@RequestMapping("/board")

public class BoardController {
	
	@Autowired
	private BoardDAO dao;

	@Autowired
	private HttpSession session; //세션유지
	
	
	@RequestMapping("boardmain")
	public String boardmain() {
		
		return "board/boardmain";
	}
	
	
	@RequestMapping("write")
	public String write() {
		
		return "board/write";
	}
	
	@RequestMapping("writeContents")
	   public String writeContents(int seq,String title, String contents) throws Exception {
	      
	      
	      MemberDTO dto = (MemberDTO)session.getAttribute("login");
	      dao.contentWrite(seq,title,contents,dto.getId());
	      return "board/boardList";

	   }
	
}
