package com.main.branch.chat;

public class RoomDTO {
	private Integer roomNum;
	private String roomTitle;
	private Integer unReadCnt;
	
	private String sendId;
	private String receiveId;
	private String contents;
	private Integer isRead;
	
	
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
	public Integer getIsRead() {
		return isRead;
	}
	public void setIsRead(Integer isRead) {
		this.isRead = isRead;
	}
	public Integer getUnReadCnt() {
		return unReadCnt;
	}
	public void setUnReadCnt(Integer unReadCnt) {
		this.unReadCnt = unReadCnt;
	}
	public Integer getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(Integer roomNum) {
		this.roomNum = roomNum;
	}
	public String getRoomTitle() {
		return roomTitle;
	}
	public void setRoomTitle(String roomTitle) {
		this.roomTitle = roomTitle;
	}
	
	
	
}
