package com.main.branch.notice;

import java.util.Date;

public class NoticeDTO {
	private Integer r;
	private String date;
	
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Integer getR() {
		return r;
	}
	public void setR(Integer r) {
		this.r = r;
	}
	private Integer noticeNum;
	private String memberId;
	private String noticeTitle;
	private String noticeContents;
	private Date noticeDate;
	private Integer noticeHit;
	public Integer getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(Integer noticeNum) {
		this.noticeNum = noticeNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContents() {
		return noticeContents;
	}
	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public Integer getNoticeHit() {
		return noticeHit;
	}
	public void setNoticeHit(Integer noticeHit) {
		this.noticeHit = noticeHit;
	}
	
	
}
