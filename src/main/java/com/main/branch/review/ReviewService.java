package com.main.branch.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.branch.member.MemberDTO;
import com.main.branch.notify.NotifyDAO;
import com.main.branch.notify.NotifyDTO;
import com.main.branch.product.ProductDAO;
import com.main.branch.product.ProductDTO;
import com.main.branch.util.Pager;

@Service
public class ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private NotifyDAO notifyDAO;
	@Autowired
	private ProductDAO productDAO;
	
	public List<ReviewDTO> getReviewList(ReviewDTO reviewDTO){
		
		return reviewDAO.getReviewList(reviewDTO);
	}
	public int setReviewAdd(ReviewDTO reviewDTO) throws Exception {
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		reviewDTO.setMemberId(memberDTO.getMemberId());
		
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProductNum(reviewDTO.getProductNum());
		productDTO = productDAO.getProductDetail(productDTO);
//		reviewDTO.setProductNum(productDTO.getProductNum());
		
		
		
		NotifyDTO notifyDTO = new NotifyDTO();
		notifyDTO.setMemberId(productDTO.getMemberId());
		
		notifyDTO.setNotifyMessage(productDTO.getProductTitle() + " 상품의 리뷰가 등록되었습니다");
		notifyDAO.setNotifyAdd(notifyDTO);
		
		return reviewDAO.setReviewAdd(reviewDTO);
	}
	public int setReviewUpdate(ReviewDTO reviewDTO) {
		return reviewDAO.setReviewUpdate(reviewDTO);
	}
	public int setReviewDelete(ReviewDTO reviewDTO) {
		return reviewDAO.setReviewDelete(reviewDTO);
	}
}
