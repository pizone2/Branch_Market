package com.main.branch.review;

public class ReviewDTO {

		private Integer reviewNum;
		private Integer productNum;
		private String memberId;
		private String reviewContents;
		private Integer reviewScore;
		
		
		public Integer getReviewScore() {
			return reviewScore;
		}
		public void setReviewScore(Integer reviewScore) {
			this.reviewScore = reviewScore;
		}
		public Integer getReviewNum() {
			return reviewNum;
		}
		public void setReviewNum(Integer reviewNum) {
			this.reviewNum = reviewNum;
		}
		public Integer getProductNum() {
			return productNum;
		}
		public void setProductNum(Integer productNum) {
			this.productNum = productNum;
		}
		public String getMemberId() {
			return memberId;
		}
		public void setMemberId(String memberId) {
			this.memberId = memberId;
		}
		public String getReviewContents() {
			return reviewContents;
		}
		public void setReviewContents(String reviewContents) {
			this.reviewContents = reviewContents;
		}
		
}
