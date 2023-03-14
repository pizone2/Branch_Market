package com.main.branch.comments;

import java.sql.Date;

public class CommentsDTO {
	private Integer commentsNum;
	private String commentsContents;
	private Date commentsRegDate;
	private Integer boardNum;
	private String memberId;
	
	
	public Integer getCommentsNum() {
		return commentsNum;
	}
	public void setCommentsNum(Integer commentsNum) {
		this.commentsNum = commentsNum;
	}
	public String getCommentsContents() {
		return commentsContents;
	}
	public void setCommentsContents(String commentsContents) {
		this.commentsContents = commentsContents;
	}
	public Date getCommentsRegDate() {
		return commentsRegDate;
	}
	public void setCommentsRegDate(Date commentsRegDate) {
		this.commentsRegDate = commentsRegDate;
	}
	public Integer getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(Integer boardNum) {
		this.boardNum = boardNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	

	
	
}
