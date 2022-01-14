package com.lol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.lol.bean.Champlst;
import com.lol.service.ChampInfoMM;


@Controller
public class HomeController {
	
	@Autowired
	private ChampInfoMM ci;
	
	ModelAndView mav;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() throws JsonProcessingException {
		mav = ci.champlst();
		
		return mav;
	}
	
	@GetMapping(value = "aram")
	public ModelAndView aram() throws JsonProcessingException {
		mav = ci.aram();
		return mav;
	}
	
	@GetMapping(value = "/champinfo")
	public ModelAndView champInfo(Champlst cl) throws JsonProcessingException {
		
		mav = ci.getchampInfo(cl);
				
		return mav;
		
	}
	
	@GetMapping(value = "login")
	public ModelAndView login() throws JsonProcessingException {
		mav = ci.login();
		return mav;
		
	}
	
}
