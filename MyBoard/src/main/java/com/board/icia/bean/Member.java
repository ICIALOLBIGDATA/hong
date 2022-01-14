package com.board.icia.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("Member")
@Data //get set 함수를 자동으로 만들어줌
@Accessors(chain=true)
public class Member { //minfo view와 member table 기준
	private String m_id; //joinform 에 있는 div name이랑 이름이 같아야함. 매개변수에 bean을 넣으면 자동으로 넣어짐
	private String m_pwd;
	private int m_point;
	private String g_name;
	private String m_name;
	private String m_birth;
	private String m_addr;
	
}
