package com.board.icia.sevice;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.board.icia.bean.Member;
import com.board.icia.dao.IMemberDao;

//회원관리 서비스 클래스
@Service // @Component
public class MemberMM {
	private static final Logger logger = LoggerFactory.getLogger(MemberMM.class);
	
	@Autowired
	private IMemberDao mDao; // IMemberDao의 구현체

	ModelAndView mav; //forward방식이랑 response, request 방식 다 합친거

	public ModelAndView memberJoin(Member mb) {
		mav = new ModelAndView();
		String view = null;
		// Encoder(암호화) <----> Decoder(복호화)
		// 스프링은 암호화는 복호화 불가능
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(); //비밀번호를 위한 암호화(비밀번호 대신 더미숫자넣음)
		mb.setM_pwd(pwdEncoder.encode(mb.getM_pwd())); // 1111->djgkldjglksdjklgds(암호화된 코드)
		// 즉, 암호화를 하고 다시 set하는 것
		if (mDao.memberJoin(mb)) {
			view = "home"; // 성공시 로그인
			mav.addObject("check", 1); // 회원가입 성공 EL태그
		} else {
			view = "joinForm";
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView access(Member mb, HttpSession session) {
		mav = new ModelAndView();
		String view = null;

		// 스프링은 복호화 안되지만 비교는 해줌.
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(); //복호
		String encoderPwd = mDao.getSecurityPwd(mb.getM_id());

		if (encoderPwd != null) {
			if (pwdEncoder.matches(mb.getM_pwd(), encoderPwd)) {
				logger.info("로그인 성공");
				session.setAttribute("id", mb.getM_id()); //session 영역에 있어야 "로그인을 했을 때"조건이 가능

				mb = mDao.getMemberInfo(mb.getM_id()); // 세션 설명용
				
				session.setAttribute("mb", mb); // 로그인 되어있는 동안 회원정보를 화면에 출력
				// view = "boardList";
				view ="redirect:/boardlist"; //post던,get던  --> get 방식으로만 redirect
				// view ="forward:/boardlist"; //post -> post, get->get 으로 맞춰서 하는게  forward
			} else { // 비번 불일치
				view = "home";
				mav.addObject("check", 2); // request영역에 저장
			}
		} else { // 아이디 불일치
			view = "home";
			mav.addObject("check", 2); // request영역에 저장
		}
		mav.setViewName(view);
		return mav;
	}

	public boolean idAvailable(String m_id) {
		Member mb = mDao.getMemberInfo(m_id);
		if (mb == null)
			return true;  //사용가능하면 
		return false; //불가
	}

}