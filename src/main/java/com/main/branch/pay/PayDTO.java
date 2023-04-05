package com.main.branch.pay;

public class PayDTO {
	private String merchantUid;
	private String memberId;
	private String impUid;
	private String productNums;
	public String getMerchantUid() {
		return merchantUid;
	}
	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getImpUid() {
		return impUid;
	}
	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}
	public String getProductNums() {
		return productNums;
	}
	public void setProductNums(String productNums) {
		this.productNums = productNums;
	}
	
	
}
