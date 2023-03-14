package com.main.branch.commentsReply;

import java.sql.Date;

public class CommentsReplyDTO {
	private Long replyNum;
	private String replyContents;
	private Long commentsNum;
	private String memberId;
	private Date commentsReplyRegDate;
	
	
	
	public Long getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(Long replyNum) {
		this.replyNum = replyNum;
	}
	public String getReplyContents() {
		return replyContents;
	}
	public void setReplyContents(String replyContents) {
		this.replyContents = replyContents;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Long getCommentsNum() {
		return commentsNum;
	}
	public void setCommentsNum(Long commentsNum) {
		this.commentsNum = commentsNum;
	}
	public Date getCommentsReplyRegDate() {
		return commentsReplyRegDate;
	}
	public void setCommentsReplyRegDate(Date commentsReplyRegDate) {
		this.commentsReplyRegDate = commentsReplyRegDate;
	}
	
	
	
}
