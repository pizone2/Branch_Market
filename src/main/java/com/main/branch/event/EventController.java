package com.main.branch.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/event/**")
public class EventController {
	@Autowired
	private EventService eventService;
	
	@GetMapping("/list")
	public ModelAndView getEventList() {
		ModelAndView modelAndView = new ModelAndView();
		
		List<EventDTO> eventDTOs = eventService.getEventList();
		modelAndView.addObject("eventDTOs", eventDTOs);
		modelAndView.setViewName("/event/list");
		return modelAndView;
	}
	
	@GetMapping("/add")
	public ModelAndView setEventAdd() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/event/add");
		return modelAndView;
	}
	
	@PostMapping("/add")
	public ModelAndView setEventAdd(MultipartFile[] multipartFiles) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println(multipartFiles.length);
		int result = eventService.setEventAdd(multipartFiles);
		String message = "";
		String url = "/";
		if(result > 0) {
			message = "성공적으로 추가 되었습니다";
		}else {
			message = "추가 실패";
		}
		modelAndView.addObject("message", message);
		modelAndView.addObject("url", url);
		modelAndView.setViewName("/common/result");
		
		return modelAndView;
	}
	
	@GetMapping("/update")
	public ModelAndView setEventUpdate() {
		ModelAndView modelAndView = new ModelAndView();
		List<EventDTO> eventDTOs = eventService.getEventList();
		
		modelAndView.addObject("eventDTOs", eventDTOs);
		modelAndView.setViewName("/event/update");
		return modelAndView;
	}
	@PostMapping("/update")
	public ModelAndView setEventUpdate(MultipartFile multipartFile, Integer eventNum) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		int result = eventService.setEventUpdate(multipartFile, eventNum);
		String message = "";
		String url = "/";
		if(result > 0) {
			message = "성공적으로 수정 되었습니다";
		}else {
			message = "수정 실패";
		}
		modelAndView.addObject("result", result);
		modelAndView.addObject("message", message);
		modelAndView.addObject("url", url);
		modelAndView.setViewName("/common/result");
		
		return modelAndView;
	}
	
	@PostMapping("/delete")
	public ModelAndView setEventDelete(EventDTO eventDTO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		int result = eventService.setEventDelete(eventDTO);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/common/ajaxResult");
		return modelAndView;
	}
}
