package kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dao.MemberDAO;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping("signup")
	public String signup() {
		return "/member/signup";
	}
	
}
