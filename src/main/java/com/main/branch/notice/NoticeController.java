package com.main.branch.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.util.Pager;

@Controller
@RequestMapping("/notice")
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
}
