package com.board.icia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.board.icia.sevice.MemberMM;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController		//@ResponseBody 생략가능
@RequestMapping(value="/member")
public class MemberRestController {
	
	@Autowired
	private MemberMM mm;
	
/*	@GetMapping(value="/userid", produces = "text/plain;charset=utf-8")
	public ResponseEntity<?> idAvailable(String m_id){
		System.out.println("id:"+m_id);
		ResponseEntity<?> result=null;
		if(mm.idAvailable(m_id)) {
			result=ResponseEntity.ok().body("사용가능한 아이디");
		}else { //서버랑 통신성공했지만 원치않는 데이터를 err콜백함수로 반환
			result=ResponseEntity.status(HttpStatus.BAD_GATEWAY).body("사용불가 아이디");
		}
		return result;
		//return ResponseEntity.ok(mm.idAvailable(m_id));  //아이디존재시 500에러
	}
*/
	
	@GetMapping(value="/userid", produces = "application/json;charset=utf-8")
	public ResponseEntity<?> idAvailable(String m_id) throws JsonProcessingException{
		System.out.println("id:"+m_id);
		ResponseEntity<?> result=null;
		if(mm.idAvailable(m_id)) {
			System.out.println("사용가능");
			
			String json=new ObjectMapper().writeValueAsString("사용가능한 아이디");
			// jackson에서 제공해주는 ObjectMapper, json으로 변환해주는 것이다.
			
			System.out.println("json="+json);
			result=ResponseEntity.ok().body(json);
		}else { //서버랑 통신성공했지만 원치않는 데이터를 err콜백함수로 반환
			result=ResponseEntity.status(HttpStatus.BAD_GATEWAY).body("사용불가 아이디");
		}
		return result;
		//return ResponseEntity.ok(mm.idAvailable(m_id));  //아이디존재시 500에러
	}

	
	//rest 처리방식
		//검색
		@GetMapping(value="/get", produces = "application/json;charset=utf-8")
		public String[] get(Integer num){
			return new String[]{"select result:"+num};
		}
		//삽입
		@PostMapping(value="/post", produces = "application/json;charset=utf-8")
		public String[] post(Integer num){
			return new String[]{"insert result:"+num};
		}
		//삭제
		@DeleteMapping(value="/delete")
		public String[] delete(Integer num){
			return new String[]{"delete result:"+num};  //json반환하기 위해
		}
		//전체 업데이트
		@PutMapping(value="/put", produces = "application/json;charset=utf-8")
		public String[] put(Integer num){
			return new String[]{"전체update result:"+num};
		}
		//부분 업데이트
		@PatchMapping(value="/patch", produces = "application/json;charset=utf-8")
		public String[] patch(Integer num){
			return new String[]{"부분update result:"+num};
		}      
		                                     //이름이 같으면 ()생략 가능
		@GetMapping(value="/{dept}/{emp}", produces = "application/json;charset=utf-8")
		public String[] pathVariable(@PathVariable String dept, 
				                   @PathVariable("emp") String empName)	{
			System.out.println("dept="+dept);
			System.out.println("emp="+empName);
			return new String[]{"dept:"+dept+", empName:"+empName}; 
		}

	
	
	
	
	
	
}
