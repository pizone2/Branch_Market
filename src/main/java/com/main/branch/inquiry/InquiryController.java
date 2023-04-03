package com.main.branch.inquiry;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.member.MemberDTO;
import com.main.branch.util.Pager;

@Controller
@RequestMapping("/inquiry/**")
public class InquiryController {
	@Autowired
	private InquiryService inquiryService;
	@Autowired
	private InquiryDAO inquiryDAO;
	@Autowired
	private HttpSession httpSession;
	
	// --------------- 홈페이지
	@GetMapping("/home")
	public ModelAndView home() {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("/inquiry/home");
		return modelAndView;
	}
	
	// ---------------- 리스트 가져오기 ajax
	@GetMapping("/list")
	public ModelAndView getInquiryList(Pager pager) {
		ModelAndView modelAndView = new ModelAndView();
		List<InquiryDTO> inquiryDTOs = inquiryService.getInquiryList(pager);
		
		modelAndView.addObject("inquiryDTOs", inquiryDTOs);
		modelAndView.setViewName("/inquiry/list");
		return modelAndView;
	}
	// ---------------- 글 업데이트
	@GetMapping("/update")
	public ModelAndView setInquriyUpdate(InquiryDTO inquiryDTO) {
		ModelAndView modelAndView = new ModelAndView();
		inquiryDTO = inquiryService.getInquriyDetail(inquiryDTO);
		modelAndView.addObject("inquiryDTO", inquiryDTO);
		modelAndView.setViewName("/inquiry/update");
		return modelAndView;
	}
	@PostMapping("/update")
	public ModelAndView setInquriyUpdate(InquiryDTO inquiryDTO, ModelAndView modelAndView) {
		String message = "";
		String url = "./detail?inquiryNum=" + inquiryDTO.getInquiryNum();
		
		int result = inquiryService.setInquriyUpdate(inquiryDTO);
		if(result > 0) {
			message = "업데이트 완료!";
		}else {
			message = "업데이트 실패";
		}
		
		modelAndView.addObject("message", message);
		modelAndView.addObject("url", url);
		modelAndView.setViewName("/common/result");
		
		return modelAndView;
	}
	// --------------- 글 추가
	@GetMapping("/add")
	public ModelAndView setInquriyAdd() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/inquiry/add");
		return modelAndView;
	}
	@PostMapping("/add")
	public ModelAndView setInquriyAdd(InquiryDTO inquiryDTO) {
		ModelAndView modelAndView = new ModelAndView();
		// 작성자 설정
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		inquiryDTO.setMemberId(memberDTO.getMemberId());
		
		String message = "";
		String url = "/";
		int result = inquiryService.setInquriyAdd(inquiryDTO);
		if(result > 0) {
			message = "글 작성완료!";
		}else {
			message = "글 작성실패";
			url = "./add";
		}
		
		modelAndView.addObject("message", message);
		modelAndView.addObject("url", url);
		modelAndView.setViewName("/common/result");
		
		return modelAndView;
	}
	// --------------- 글 삭제
	@PostMapping("/delete")
	public ModelAndView setInquiryDelete(InquiryDTO inquiryDTO) {
		ModelAndView modelAndView = new ModelAndView();
		
		int result = inquiryService.setInquiryDelete(inquiryDTO);
		if(result > 0) {
			modelAndView.addObject("result", "true");
		}else {
			modelAndView.addObject("result", "false");
		}
		modelAndView.setViewName("/common/ajaxResult");
		
		return modelAndView;
	}
	// -------------- 내 문의내역 보기
	@GetMapping("/myList")
	public ModelAndView getInquiryMyList(Pager pager) {
		ModelAndView modelAndView = new ModelAndView();
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		pager.setMemberId(memberDTO.getMemberId());
		
		List<InquiryDTO> inquiryDTOs = inquiryService.getInquiryList(pager);
		modelAndView.addObject("inquiryDTOs", inquiryDTOs);
		modelAndView.setViewName("/inquiry/myList");
		return modelAndView;
	}
	// ------------- 문의내역 상세보기
	@GetMapping("/detail")
	public ModelAndView getInquriyDetail(InquiryDTO inquiryDTO) {
		ModelAndView modelAndView = new ModelAndView();
		inquiryDTO = inquiryService.getInquriyDetail(inquiryDTO);
		modelAndView.addObject("inquiryDTO", inquiryDTO);
		
		// rowNum으로 이전글 다음글 가져오기

		InquiryDTO preInquiryDTO = new InquiryDTO();
		preInquiryDTO.setR(inquiryDTO.getR() - 1);
		preInquiryDTO = inquiryDAO.getInquriyDetailRowNum(preInquiryDTO);
		
		InquiryDTO nextInquiryDTO = new InquiryDTO();
		nextInquiryDTO.setR(inquiryDTO.getR() + 1);
		nextInquiryDTO = inquiryDAO.getInquriyDetailRowNum(nextInquiryDTO);
		
		modelAndView.addObject("preInquiryDTO", preInquiryDTO);
		modelAndView.addObject("nextInquiryDTO", nextInquiryDTO);
		
		modelAndView.setViewName("/inquiry/detail");
		return modelAndView;
		
	}
	
}
