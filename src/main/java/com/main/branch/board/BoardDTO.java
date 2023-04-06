package com.main.branch.board;

import java.sql.Date;

public class BoardDTO {
	private Integer boardNum;
	private String memberId;
	private String boardTitle;
	private String boardContents;
	private String boardDate;
	private Integer boardHit;
	private String boardPrice;
	private String boardState;
	private String boardCategory;
	private BoardImgDTO boardImgDTO;
	
	
	public BoardImgDTO getBoardImgDTO() {
		return boardImgDTO;
	}
	public void setBoardImgDTO(BoardImgDTO boardImgDTO) {
		this.boardImgDTO = boardImgDTO;
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
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContents() {
		return boardContents;
	}
	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public Integer getBoardHit() {
		return boardHit;
	}
	public void setBoardHit(Integer boardHit) {
		this.boardHit = boardHit;
	}
	public String getBoardPrice() {
		return boardPrice;
	}
	public void setBoardPrice(String boardPrice) {
		this.boardPrice = boardPrice;
	}
	public String getBoardState() {
		return boardState;
	}
	public void setBoardState(String boardState) {
		this.boardState = boardState;
	}
	public String getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}
	
	
}