package com.board.icia.controller;

import java.util.HashMap;
import java.util.List;
//import java.util.Map;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.board.icia.bean.Board;
import com.board.icia.bean.Member;
import com.board.icia.bean.Reply;
import com.board.icia.bean.Thumb;
import com.board.icia.sevice.BoardMM;

@RestController // 메소드에 @ResponseBody 생략가능
@RequestMapping(value="/rest") // 대분류를 미리 빼놓으면 url에 value값을 빼도 된다.
public class BoardRestController {
	
	@Autowired
	private BoardMM bm;
	
	@PostMapping(value = "/replyinsert", produces = "application/json;charset=utf-8") // /rest/replyinsert
	public List<Reply> replyInsert(@RequestBody Reply r,HttpSession session) {
		System.out.println("★★★★★★★★★★★★★★★★★★★★★★★★★★★replyinsert called★★★★★★★★★");
		r.setR_id(session.getAttribute("id").toString());
		List<Reply> rList=bm.replyInsert(r);
		// 원래는 json으로 변환 해야했지만 알아서 변환해준다.
		// 단, Map은 변환해주지 않는다.
		
		return rList;   //자바객체--->jackson---> json 변환
		//스프링의 메세지 컨버터: 서버에서 클라이언트사이 데이터(객체->json)를 변환해서 보내준다.
		//new ObjectMapper().writeValue(out, value); 객체-->json
		//new ObjectMapper().readValue(out, value); jons-->객체
	}

	@PostMapping(value="/boardwrite")
	public Map<String, String> boardWrite(Board board,List<MultipartFile> files) {
		System.out.println("title="+board.getB_title());
		System.out.println("contents="+board.getB_contents());
		//System.out.println("fileCheck="+fileCheck);
		System.out.println("file1="+files.get(0).getOriginalFilename());
		System.out.println("file2="+files.get(1).getOriginalFilename());
		Map<String,String> map=new HashMap<>();
		map.put("msg", "파일업로드 성공");
		return map;  //jackson이 json으로 변환못하면 Map등 자바객체에 저장할 것.
	}
	
	@PostMapping(value="/addthumbs")
	public int addthumbs(Thumb thumb) {
		
		int result;
		result = bm.addThumbs(thumb);
		
		return result;  //jackson이 json으로 변환못하면 Map등 자바객체에 저장할 것.
	}


}
