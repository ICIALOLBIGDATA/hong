package com.board.icia.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("BoardFile")
@Data
@Accessors(chain=true)
public class BoardFile { // DB와 동일한 구조의 Entity
	
	private int bf_num; //pk
	private int bf_bnum; //fk
	private String bf_oriName;
	private String bf_sysName;
	
}
