package com.main.branch.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.product.ProductDTO;
import com.main.branch.util.Pager;

@Controller
@RequestMapping("/review/**")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	
	// ---------------------- 리스트 가져오기
	@GetMapping("list")
	public ModelAndView getReviewList(ReviewDTO reviewDTO) {
		ModelAndView modelAndView = new ModelAndView();
		List<ReviewDTO> reviewDTOs = reviewService.getReviewList(reviewDTO);
		
		modelAndView.addObject("reviewDTOs", reviewDTOs);
		modelAndView.setViewName("/common/reviewList");
		return modelAndView;
	}
	// ----------------- 추가하기
	@PostMapping("add")
	public ModelAndView setReviewAdd(ReviewDTO reviewDTO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		int reuslt = reviewService.setReviewAdd(reviewDTO);
		if(reuslt > 0) {
			modelAndView.addObject("result", "true");
		}else {
			modelAndView.addObject("result", "false");
		}
		modelAndView.setViewName("/common/ajaxResult");
		return modelAndView;
	}
	// -------------------- 수정하기
	@PostMapping("update")
	public ModelAndView setReviewUpdate(ReviewDTO reviewDTO) {
		ModelAndView modelAndView = new ModelAndView();
		
		int reuslt = reviewService.setReviewUpdate(reviewDTO);
		
		if(reuslt > 0) {
			modelAndView.addObject("result", "true");
		}else {
			modelAndView.addObject("result", "false");
		}
		modelAndView.setViewName("/common/ajaxResult");
		
		return modelAndView;
	}
	// ----------------- 삭제하기
	@PostMapping("delete")
	public ModelAndView setReviewDelete(ReviewDTO reviewDTO) {
		ModelAndView modelAndView = new ModelAndView();
		int reuslt = reviewService.setReviewDelete(reviewDTO);
		System.out.println(reviewDTO.getReviewNum());
		
		if(reuslt > 0) {
			modelAndView.addObject("result", "true");
		}else {
			modelAndView.addObject("result", "false");
		}
		modelAndView.setViewName("/common/ajaxResult");
		
		return modelAndView;
	}
}
