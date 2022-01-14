package com.board.icia.bean;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("Reply")
@Data
@Accessors(chain=true)
public class Reply {
	
	private int r_bnum; //원글 번호
	private int r_num; // pk, 댓글 번호
	private String r_contents;
	private String r_id;
	//메세지 컨버터(jackson): 서버에서 클라이언트로 데이터를 변환해서 보내준다.
	//jackson 과 Timestamp서로 호환되지 않아서 깨진다.
	//hh:12시간제, HH:24시간제, mm:분, MM:월
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "Asia/Seoul")
	//@JsonIgnore //select * from m  //비번은 출력 제외
	private Timestamp r_date;
	//private String r_date;   //오라클에서 to_char(날짜데이터)
	
	
}
