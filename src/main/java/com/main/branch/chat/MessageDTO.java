package com.main.branch.chat;

import java.util.Date;

public class MessageDTO {
	private Integer messageNum;
	private Integer roomNum;
	private String sendId;
	private String receiveId;
	private String contents;
	private Date sendDate;
	private Integer isRead;
	
	public Integer getMessageNum() {
		return messageNum;
	}
	public void setMessageNum(Integer messageNum) {
		this.messageNum = messageNum;
	}
	public Integer getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(Integer roomNum) {
		this.roomNum = roomNum;
	}
	public String getSendId() {
		return sendId;
	}
	public void setSendId(String sendId) {
		this.sendId = sendId;
	}
	public String getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public Integer getIsRead() {
		return isRead;
	}
	public void setIsRead(Integer isRead) {
		this.isRead = isRead;
	}
	
	
}
