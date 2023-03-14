package com.main.branch.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.member.MemberDTO;
import com.main.branch.util.Pager;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/home")
	public ModelAndView home() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/admin/home");
		return modelAndView;
	}
	// ----------------------- 멤버 리스트
	@GetMapping("/memberList")
	public ModelAndView getMemberList(Pager pager) {
		ModelAndView modelAndView = new ModelAndView();
		
		List<MemberDTO> memberDTOs = adminService.getMemberList(pager);
		
		modelAndView.addObject("memberDTOs", memberDTOs);
		modelAndView.setViewName("/admin/memberList");
		return modelAndView;
	}
	// -------------------- 관리자 추가
	@GetMapping("/add")
	public ModelAndView setAdminAdd() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/admin/add");
		return modelAndView;
	}
	@PostMapping("/add")
	public ModelAndView setAdminAdd(MemberDTO memberDTO) {
		ModelAndView modelAndView = new ModelAndView();
		int result = adminService.setAdminAdd(memberDTO);
		String url = "./home";
		String message = "";
		if(result > 0) {
			message = "관리자가 추가 되었습니다";
		}else {
			message = "관리자가 추가되지 않았습니다";
		}
		modelAndView.addObject("message", message);
		modelAndView.addObject("url", url);
		modelAndView.setViewName("/common/result");
		return modelAndView;
	}
	
}
