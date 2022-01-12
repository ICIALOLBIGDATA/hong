package com.lol.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lol.bean.Champlst;
import com.lol.dao.Iloldao;

@Service
public class ChampInfoMM {

	@Autowired
	private Iloldao idao;
	
	ModelAndView mav;

	public ModelAndView getchampInfo(Champlst cl) throws JsonProcessingException {
		mav = new ModelAndView();
		
		
		if(cl.getChamp_code() != 0) {
			cl = idao.getChampInfo(cl.getChamp_code());
		}else {
			if("".equals(cl.getChampionname()) || cl.getChampionname() == null) {
				cl = idao.getChampnameinfo(cl.getChampname());
			}else{
				cl = idao.getChampionnameinfo(cl.getChampionname());
			}
		}
	
		ObjectMapper mapper = new ObjectMapper();
		String jackson = mapper.writeValueAsString(cl);
		String view = "champinfo";
		mav.addObject("champinfo",jackson);
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView champlst() throws JsonProcessingException {
		mav = new ModelAndView();
		
		List<Champlst> clist = null;
		
		clist = idao.getChampLst();
		ObjectMapper mapper = new ObjectMapper();
		String jackson = mapper.writeValueAsString(clist);
		String view = "main";
		mav.addObject("champ",jackson);
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView aram() throws JsonProcessingException {
		mav = new ModelAndView();
		
		List<Champlst> clist = null;
		clist = idao.getChampionlist();
		
		List<Champlst> tlist = null;
		tlist = idao.getChampionTierlist();
		
		ObjectMapper mapper = new ObjectMapper();
		String jackson = mapper.writeValueAsString(clist);
		String jackson2 = mapper.writeValueAsString(tlist);
		
		String view = "aram";
		mav.addObject("champlst",jackson);
		mav.addObject("champtierlst",jackson2);
		mav.setViewName(view);
		
		return mav;
	}


	
	
	
}
