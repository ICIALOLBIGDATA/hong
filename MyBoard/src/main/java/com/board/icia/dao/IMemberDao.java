package com.board.icia.dao;

import com.board.icia.bean.Member;

//회원관리 DAO
//@Repository //@Component --> 클래스인 경우에만 사용
public interface IMemberDao {

	boolean access(Member mb);
	
	boolean memberJoin(Member mb);

	public String getSecurityPwd(String m_id); //Mapper 에 있는 m_id랑 이름 동일해야함

	public Member getMemberInfo(String m_id);

	
	
}
