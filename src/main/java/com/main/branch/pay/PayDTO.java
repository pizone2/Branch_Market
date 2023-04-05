package com.main.branch.pay;

import java.util.Date;

public class PayDTO {
	private String merchantUid;
	private String memberId;
	private String impUid;
	private String productNums;
	private String productTitle;
	private Date payDate;
	
	
	
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public String getProductTitle() {
		return productTitle;
	}
	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}
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
