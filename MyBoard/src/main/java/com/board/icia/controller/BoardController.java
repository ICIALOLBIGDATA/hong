package com.board.icia.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.icia.bean.Board;
import com.board.icia.bean.Member;
import com.board.icia.exception.DbException;
import com.board.icia.sevice.BoardMM;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController { // 게시판 관련 컨트롤러
	
	@Autowired
	private BoardMM bm; // 게시판 서비스 클래스
	
	ModelAndView mav; // 선택
	
	@RequestMapping(value = "/boardlist") // get, post 모두 가능
	public ModelAndView getBoardList(Integer pageNum, HttpServletRequest req) { // 필수로 인자를 받을땐 @RequestParam 를 붙인다.
		mav = bm.getBoardList(pageNum);
		return mav;
	}
	
	@GetMapping(value = "/contents")
	public ModelAndView getContents(Board board,Member mb, HttpSession session) {
		Integer bNum = board.getB_num();
		String m_id = mb.getM_id();
		bm.viewUpdate(bNum);//조회수 올리는 함수
		mav = bm.getContents(bNum, m_id , session);
		return mav;
	}
	
	@GetMapping(value = "writefrm")
	public String writeFrm() {
		return "writeFrm";   // jsp
	}
	
	@PostMapping(value = "boardwrite")
	public ModelAndView boardwrite(Board board, List<MultipartFile> files, HttpSession session) {
		mav = bm.boardWrite(board, files, session);
		return mav;
		}
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	// map에선 @RequestParam을 생략하면 비어있는 Map객체를 주입한다.
	public void download(@RequestParam Map<String, Object> params, 
			HttpServletRequest req, HttpServletResponse resp)
	
			throws Exception {
			
			System.out.println("1=" + params.get("sysFileName"));
			System.out.println("2=" + params.get("oriFileName"));
			// 다운로드하기 위한 물리적 주소
			params.put("root", req.getSession().getServletContext().getRealPath("/"));
			params.put("response", resp);
			bm.download(params);
	}
		
	
	@PostMapping(value = "/boarddelete")
	public ModelAndView boardDelete(Integer bNum, RedirectAttributes attr) throws DbException{
		//System.out.println("bNum="+bNum);
		mav=bm.boardDelete(bNum,attr);
		return mav; //
	}
	
	@GetMapping(value = "/test")   // @RequestParam이 생략
	public ModelAndView myBatisTest(String colName, Integer search){
		mav=bm.myBatisTest(colName,search);
		return mav; //
	}
	
	@GetMapping(value = "/testmap")   // Map은 RequestParam이 있어야함
	public ModelAndView myBatisTestMap(@RequestParam Map<String, Object> hMap){
		mav=bm.myBatisTestMap(hMap);
		return mav; //
	}
	
	
}
