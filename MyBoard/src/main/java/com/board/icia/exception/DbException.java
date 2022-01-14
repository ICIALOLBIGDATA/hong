package com.board.icia.exception;

public class DbException extends RuntimeException {  
	public DbException() {
		super("TX에서는 개발자 정의 예외클래스의 RuntimeException(선택) 예외만 처리함,"
		   + " 시스템의 모든 필수,선택 모든 예외는 롤백처리함");
	}
}
