package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.spring.dao.BoardDAO;
import kh.spring.dto.BoardDTO;

@Component
@RequestMapping("/board")
public class BoardController {
   
   @Autowired
   private BoardDAO dao;
   
   @Autowired HttpSession session;
   
   @RequestMapping("boardMain")
      public String boardMain(Model model) {
      List<BoardDTO> list = dao.selectAll();
      model.addAttribute("list", list);//return시에 데이터를 알아서 가지고감
      
         return "board/boardMain";
      }
   
   @RequestMapping("boardWrite")
      public String boardWrite() {
      
      return "board/boardWrite";
   }
   
   @RequestMapping("boardWriteProc")
   public String writeContents(String title, String contents) throws Exception {
      
      System.out.println(title);
      System.out.println(contents);
      
      
      String id = (String)session.getAttribute("loginID");
      dao.contentWrite(title,contents,id);
      return "redirect:boardMain";

   }
   
   @RequestMapping("boardDetail")
   public String boardDetail(@RequestParam("seq") int seq, Model model) { //
	   System.out.println();//게시물에서 받온 seq 번호
	   
   List<BoardDTO> detailList = dao.selectView(seq);//개별 게시물 불러오는 dao실행(seq넣어서)
   model.addAttribute("view", detailList);   
   return "board/boardDetail";
}

   @RequestMapping("boardDelete")
   public String boardDelete(@RequestParam("seq")int seq) {
	   
	   dao.boardDelete(seq);
	   return "redirect:boardMain";
   }
   @RequestMapping("boardEdit")
   public String boardEdit(@RequestParam("seq")int seq,Model model) {
	   System.out.println();//게시물에서 받온 seq 번호
	   
	   List<BoardDTO> detailList = dao.selectView(seq);//개별 게시물 불러오는 dao실행(seq넣어서)
	   model.addAttribute("view", detailList);   
	   return "board/boardUpdate";
   }
  
   @RequestMapping("boardEditProc")
   public String boardEditProc(@RequestParam("seq")int seq,@RequestParam("title") String title,@RequestParam("contents") String contents) {
	System.out.println(seq);
	System.out.println(title);
	System.out.println(contents);
	   int result = dao.boardEdit(seq,title,contents);
	   
	   return "redirect:boardDetail?seq="+seq;
	   
	
   }
  


}