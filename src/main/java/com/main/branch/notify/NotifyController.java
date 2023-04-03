package com.main.branch.notify;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.util.Pager;

@Controller
@RequestMapping(value = "/notify/**")
public class NotifyController {

	@Autowired
	private NotifyService notifyService;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping("list")
	public ModelAndView getNotifyList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<NotifyDTO> ar = notifyService.getNotifyList(pager);
		mv.addObject("list", ar);
		mv.setViewName("notify/list");
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView setNotifyAdd(ModelAndView mv) throws Exception{
		mv.setViewName("notify/add");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setNotifyAdd(NotifyDTO notifyDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
//		System.out.println("Name : "+files.get());
		System.out.println(session.getServletContext());
		
		Integer result = notifyService.setNotifyAdd(notifyDTO);
		
		mv.addObject("result", result);
		mv.setViewName("/common/ajaxResult");
		
		return mv;
		
	}
	
	@PostMapping("delete")
	public ModelAndView setNotifyDelete(NotifyDTO notifyDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		Integer result = notifyService.setNotifyDelete(notifyDTO);
		
		String message = "삭제 실패";
		
		if(result>0) {
			message = "게시물이 삭제되었습니다";
		}
		mv.addObject("result", message);
		mv.addObject("url", "./list");
		mv.setViewName("common/result");
		
		return mv;
	}
	
}
