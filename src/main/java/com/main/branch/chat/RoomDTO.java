package com.main.branch.chat;

public class RoomDTO {
	private Integer roomNum;
	private String roomTitle;
	
	private Integer unReadCnt;
	
	
	
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
