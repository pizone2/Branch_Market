package com.main.branch.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.util.Pager;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/list")
	public ModelAndView getNoticeList(Pager pager){
		ModelAndView modelAndView = new ModelAndView();
		List<NoticeDTO> noticeDTOs = noticeService.getNoticeList(pager);
		
		modelAndView.addObject("noticeDTOs", noticeDTOs);
		modelAndView.setViewName("/notice/list");
		return modelAndView;
	}
	// -------------- add
	@GetMapping("/add")
	public ModelAndView setNoticeAdd() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/notice/add");
		return modelAndView;
	}
	@PostMapping("/add")
	public ModelAndView setNoticeAdd(NoticeDTO noticeDTO) {
		ModelAndView modelAndView = new ModelAndView();
		
		int result = noticeService.setNoticeAdd(noticeDTO);
		String message = "";
		String url = "./list";
		
		if(result > 0) {
			message = "성공적으로 추가완료";
		}else {
			message = "추가 실패";
		}
		
		modelAndView.addObject("message", message);
		modelAndView.addObject("url", url);
		modelAndView.setViewName("/common/result");
		return modelAndView;
	}
	// -------------- detail
	@GetMapping("/detail")
	public ModelAndView getNoticeDetail(NoticeDTO noticeDTO) {
		ModelAndView modelAndView = new ModelAndView();
		
		noticeDTO = noticeService.getNoticeDetail(noticeDTO);
		
		modelAndView.addObject("noticeDTO", noticeDTO);
		modelAndView.setViewName("/notice/detail");
		return modelAndView;
	}
	// ----------- delete
	@PostMapping("/delete")
	public ModelAndView setNoticeDelete(NoticeDTO noticeDTO) {
		ModelAndView modelAndView = new ModelAndView();
		
		int result = noticeService.setNoticeDelete(noticeDTO);
		
		if(result > 0) {
			modelAndView.addObject("result", "true");
		}else {
			modelAndView.addObject("result", "false");
		}
		
		modelAndView.setViewName("/common/ajaxResult");
		return modelAndView;
	}
	// ------- update
	@GetMapping("/update")
	public ModelAndView setNoticeUpdate(NoticeDTO noticeDTO) {
		ModelAndView modelAndView = new ModelAndView();
		noticeDTO = noticeService.getNoticeDetail(noticeDTO);
		modelAndView.addObject("noticeDTO", noticeDTO);
		modelAndView.setViewName("/notice/update");
		return modelAndView;
	}
	@PostMapping("/update")
	public ModelAndView setNoticeUpdate(NoticeDTO noticeDTO,ModelAndView modelAndView) {
		int result = noticeService.setNoticeUpdate(noticeDTO);
		String message = "";
		String url = "./list";
		
		if(result > 0) {
			message = "성공적으로 업데이트 완료";
		}else {
			message = "업데이트 실패";
		}
		
		modelAndView.addObject("message", message);
		modelAndView.addObject("url", url);
		modelAndView.setViewName("/common/result");
		return modelAndView;
		
	}
}
