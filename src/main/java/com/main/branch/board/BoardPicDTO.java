package com.main.branch.board;

import java.sql.Date;

public class BoardPicDTO {
	private Integer boardNum;
	private String MemberId;
	public Integer getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(Integer boardNum) {
		this.boardNum = boardNum;
	}
	public String getMemberId() {
		return MemberId;
	}
	public void setMemberId(String memberId) {
		MemberId = memberId;
	}
	
	
	
}