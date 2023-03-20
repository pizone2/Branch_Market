package com.main.branch.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.branch.member.MemberDTO;
import com.main.branch.util.Pager;

@Service
public class ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private HttpSession httpSession;
	
	public List<ReviewDTO> getReviewList(Pager pager){
		pager.setPerPage(5);
		pager.makeNum(reviewDAO.getReviewCount(pager));
		pager.makeRow();
		
		return reviewDAO.getReviewList(pager);
	}
	public int setReviewAdd(ReviewDTO reviewDTO) {
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		reviewDTO.setMemberId(memberDTO.getMemberId());
		
		return reviewDAO.setReviewAdd(reviewDTO);
	}
	public int setReviewUpdate(ReviewDTO reviewDTO) {
		return reviewDAO.setReviewUpdate(reviewDTO);
	}
	public int setReviewDelete(ReviewDTO reviewDTO) {
		return reviewDAO.setReviewDelete(reviewDTO);
	}
}
