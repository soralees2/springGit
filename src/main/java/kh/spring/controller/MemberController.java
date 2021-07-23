package kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kh.spring.dao.MemberDAO;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO dao;
}
