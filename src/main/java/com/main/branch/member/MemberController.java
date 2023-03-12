package com.main.branch.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.util.ApiCallManager;
import com.main.branch.util.Naver;
import com.main.branch.util.Pager;

@Controller
@RequestMapping(value = "/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/list")
	public ModelAndView getMemberList() {
		ModelAndView modelAndView = new ModelAndView();
		
		List<MemberDTO> memberDTOs = memberService.getMemberList();
		
		modelAndView.addObject("memberDtos", memberDTOs);
		modelAndView.setViewName("/member/list");
		return modelAndView;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// -------------------------테스트 전용---------------------------------
	@GetMapping("/test")
	public ModelAndView test() {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("/member/test");
		return modelAndView;
	}
	
	@GetMapping("/getTest")
	public ModelAndView getTest(Pager pager) {
		ModelAndView modelAndView = new ModelAndView();
		
		pager.setPage(2); // 페이지 번호
		pager.setPerPage(20); // 페이지당 몇개 보여줄지 10~100
		pager.makeRow();
		pager.setSearch("장난감"); // 사용자 검색어
		// Client ID, Client Secret
		String datas = Naver.getShoppingData(null, null, pager);
		modelAndView.addObject("result", datas);
		modelAndView.setViewName("/common/ajaxResult");
		return modelAndView;
	}
	
	@GetMapping("/postTest")
	public ModelAndView test2() {
		Map<String, String> parms = new HashMap<String, String>();
		parms.put("name", "강한나");
		String result = ApiCallManager.post("http://localhost/member/postTestServer", null, parms);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/common/ajaxResult");
		return modelAndView;
	}
	
	@PostMapping("/postTestServer")
	public ModelAndView postTestServer(String name) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", "name is " + name);
		modelAndView.setViewName("/common/ajaxResult");
		return modelAndView;
	}
	// -------------------------테스트 전용---------------------------------
}
