package com.main.branch.notify;

import java.sql.Date;

public class NotifyDTO {

	private Integer r;
	private Integer notifyNum;
	private String memberId;
	private String notifyMessage;
	private Date notifyDate;
	
	
	public Integer getR() {
		return r;
	}
	public void setR(Integer r) {
		this.r = r;
	}
	public Integer getNotifyNum() {
		return notifyNum;
	}
	public void setNotifyNum(Integer notifyNum) {
		this.notifyNum = notifyNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getNotifyMessage() {
		return notifyMessage;
	}
	public void setNotifyMessage(String notifyMessage) {
		this.notifyMessage = notifyMessage;
	}
	public Date getNotifyDate() {
		return notifyDate;
	}
	public void setNotifyDate(Date notifyDate) {
		this.notifyDate = notifyDate;
	}
	
}
