package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dao.MemberDAO;
import kh.spring.dto.MemberDTO;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberDAO dao;

	@Autowired
	public HttpSession session;
	
	@RequestMapping("signup")
	public String signup() {
		return "member/signup";
	}
	
	@RequestMapping("loginProc")
	public String loginProc(String id, String pw) {
		int result = dao.login(id, pw);
		if(result>0) {
			session.setAttribute("loginID", id);
		}
		return "redirect:/";
	}
	
	@RequestMapping("logout")
	public String logout() {
		session.removeAttribute("loginID");
		return "redirect:/";
	}
		
	@RequestMapping("mypage")
	public String mypage(Model model) throws Exception{
		String id = (String)session.getAttribute("loginID");
		MemberDTO dto = dao.getMyInfo(id);
		model.addAttribute("login",dto);
		
		return "member/mypage";
	}
	
	@RequestMapping("modifyInfo")
	public String modifyInfo(MemberDTO dto) throws Exception{
		int result = dao.update(dto);
		return "redirect:member/mypage";
	}
	
	@RequestMapping("memberout")
	public String memberout() throws Exception{
		String delId = (String)session.getAttribute("loginID");
		int result = dao.memberOut(delId);
		session.removeAttribute("loginID");
		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping(value= "idCheck" , produces="text/html;charset=utf8")
	public String idCheck(String id) {
		int result = dao.idCheck(id);
		return String.valueOf(result);
	}
	@RequestMapping("join")
	public String join(HttpServletRequest request) {
		String id=request.getParameter("id");
		String pw= request.getParameter("inp_pw01");
		String name= request.getParameter("name");
		String phone= request.getParameter("phone")+request.getParameter("phone1")+request.getParameter("phone2");
		String email=request.getParameter("email");
		String zipcode=request.getParameter("zipcode");
		String address1=request.getParameter("address1");
		String address2=request.getParameter("address2");
		dao.join(new MemberDTO(id,pw,name,phone,email,zipcode,address1,address2,null));
		return "redirect:/";
	}
}
