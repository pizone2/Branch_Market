package com.main.branch.InqComments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.util.Pager;

@Controller
@RequestMapping("/inqComments/**")
public class InqCommentsController {
	@Autowired
	private InqCommentsService inqCommentsService;
	
	
	// ---------------------- 리스트 가져오기
	@GetMapping("/list")
	public ModelAndView getInqCommentsList(Pager pager) {
		ModelAndView modelAndView = new ModelAndView();
		List<InqCommentsDTO> inqCommentsDTOs = inqCommentsService.getInqCommentsList(pager);
		
		modelAndView.addObject("inqCommentsDTOs", inqCommentsDTOs);
		modelAndView.setViewName("/common/inqCommentsList");
		return modelAndView;
	}
	// ----------------- 추가하기
	@PostMapping("/add")
	public ModelAndView setInqCommentsAdd(InqCommentsDTO inqCommentsDTO) {
		ModelAndView modelAndView = new ModelAndView();
		int reuslt = inqCommentsService.setInqCommentsAdd(inqCommentsDTO);
		if(reuslt > 0) {
			modelAndView.addObject("result", "true");
		}else {
			modelAndView.addObject("result", "false");
		}
		modelAndView.setViewName("/common/ajaxResult");
		return modelAndView;
	}
	// -------------------- 수정하기
	@PostMapping("/update")
	public ModelAndView setInqCommentsUpdate(InqCommentsDTO inqCommentsDTO) {
		ModelAndView modelAndView = new ModelAndView();
		
		int reuslt = inqCommentsService.setInqCommentsUpdate(inqCommentsDTO);
		if(reuslt > 0) {
			modelAndView.addObject("result", "true");
		}else {
			modelAndView.addObject("result", "false");
		}
		modelAndView.setViewName("/common/ajaxResult");
		
		return modelAndView;
	}
	// ----------------- 삭제하기
	@PostMapping("/delete")
	public ModelAndView setInqCommentsDelete(InqCommentsDTO inqCommentsDTO) {
		ModelAndView modelAndView = new ModelAndView();
		int reuslt = inqCommentsService.setInqCommentsDelete(inqCommentsDTO);
		
		if(reuslt > 0) {
			modelAndView.addObject("result", "true");
		}else {
			modelAndView.addObject("result", "false");
		}
		modelAndView.setViewName("/common/ajaxResult");
		
		return modelAndView;
	}
}
