package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
   public String boardDetail(Model model) {
   
   
   return "board/boardDetail";
}

   
   



}