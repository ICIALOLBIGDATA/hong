package com.board.icia.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.board.icia.bean.Member;
import com.board.icia.sevice.MemberMM;

@Controller
public class HomeController { //회원관련 컨트롤러
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class); //여기에 logger 정의해줌
	
	@Autowired
	private MemberMM mm; // <== DAO <== 스프링 DI
	
	ModelAndView mav;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/joinform") //쓰지 않으면 GET, POST를 둘다 받는다.
	public String joinForm() {
		logger.info("회원가입창으로 이동"); //sysout 역할
		return "joinForm";
	}
	
	@RequestMapping(value = "/memberjoin", method = RequestMethod.POST) //쓰지 않으면 GET, POST를 둘다 받는다.
	public ModelAndView memberJoin(Member mb) {
		
		logger.info("회원가입");
		mav = mm.memberJoin(mb);
		return mav; // 임시
	}
	
	@PostMapping(value = "/access") //쓰지 않으면 GET, POST를 둘다 받는다.
	public ModelAndView access(Member mb, HttpSession session) {
		mav = mm.access(mb, session);
		
		return mav; // //.jsp
	}
	
	@PostMapping(value = "/logout") //쓰지 않으면 GET, POST를 둘다 받는다.
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/"; // get,post --> get으로만 
	}
}
