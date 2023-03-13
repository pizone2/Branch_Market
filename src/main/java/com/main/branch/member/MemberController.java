package com.main.branch.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	@GetMapping("/list")
	public ModelAndView getMemberList() {
		ModelAndView modelAndView = new ModelAndView();
		
		List<MemberDTO> memberDTOs = memberService.getMemberList();
		
		modelAndView.addObject("memberDtos", memberDTOs);
		modelAndView.setViewName("/member/list");
		return modelAndView;
	}
	// --------------------- memberDelete
	@PostMapping("/delete")
	public ModelAndView setMemberDelete(MemberDTO memberDTO) {
		ModelAndView modelAndView = new ModelAndView();
		
		int result = memberService.setMemberDelete(memberDTO);
		if(result > 0) {
			modelAndView.addObject("message", "회원 탈퇴가 완료되었습니다");
		}else {
			modelAndView.addObject("message", "회원 탈퇴오류 발생했습니다");
		}
		modelAndView.addObject("url", "/");
		modelAndView.setViewName("/common/result");
		return modelAndView;
	}
	// --------------------- memberDetail
	@GetMapping("/detail")
	public ModelAndView getMemberDetail(MemberDTO memberDTO) {
		ModelAndView modelAndView = new ModelAndView();
		
		memberDTO = memberService.getMemberDetail(memberDTO);
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.setViewName("/member/detail");
		return modelAndView;
	}
	// --------------------- memberUpdate
	@GetMapping("/update")
	public ModelAndView setMemberUpdate() {
		ModelAndView modelAndView = new ModelAndView();
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		memberDTO = memberService.getMemberDetail(memberDTO);
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.setViewName("/member/update");
		return modelAndView;
	}
	// 나중에 세션에 있는 아이디랑 비교체크
	@PostMapping("/update")
	public ModelAndView setMemberUpdate(MemberDTO memberDTO) {
		ModelAndView modelAndView = new ModelAndView();
		if(memberService.checkMemberIdPw(memberDTO)) {
			int result = memberService.setMemberUpdate(memberDTO);
			if(result > 0) {
				modelAndView.addObject("message", "업데이트 완료!");
				modelAndView.addObject("url", "/");
			}else {
				modelAndView.addObject("message", "업데이트 실패..");
				modelAndView.addObject("url", "./update");
			}
		}else {
			modelAndView.addObject("message", "잘못된 아이디 패스워드..");
			modelAndView.addObject("url", "./update");
		}
		
		modelAndView.setViewName("/common/result");
		return modelAndView;
	}
	// ---------------- memberLogout
	@GetMapping("/logout")
	public ModelAndView setMemberLogout() {
		ModelAndView modelAndView = new ModelAndView();
		httpSession.invalidate();
		modelAndView.setViewName("redirect: /");
		return modelAndView;
	}
	// ---------------- memberLogin
	@GetMapping("/login")
	public ModelAndView setMemberLogin() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/login");
		return modelAndView;
	}
	@PostMapping("/login")
	public ModelAndView setMemberLogin(MemberDTO memberDTO,String cookieMemberId) {
		System.out.println(memberDTO.getMemberId());
		System.out.println();
		ModelAndView modelAndView = new ModelAndView();
		if(cookieMemberId.equals("cookieMemberId")) {
			Cookie cookie = new Cookie("cookieMemberId", memberDTO.getMemberId());
			cookie.setPath("/");
			cookie.setMaxAge(60*60*24*7);
			response.addCookie(cookie);
		}
		
		memberDTO = memberService.setMemberLogin(memberDTO);
		if(memberDTO != null) {
			httpSession.setAttribute("member", memberDTO);
			modelAndView.setViewName("redirect: /");
		}else {
			modelAndView.addObject("message", "로그인 실패!");
			modelAndView.addObject("url", "./login");
			modelAndView.setViewName("/common/result");
		}
		return modelAndView;
	}
	
	// --------------------------- memberAdd
	@GetMapping("/addAgree")
	public ModelAndView addAgree() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/addAgree");
		return modelAndView;
	}
	@GetMapping("/checkMemberUnique")
	public ModelAndView checkMemberUnique(MemberDTO memberDTO) {
		ModelAndView modelAndView = new ModelAndView();
		memberDTO = memberService.getMemberDetail(memberDTO);
		if(memberDTO == null) {
			modelAndView.addObject("result", "true");
		}else {
			modelAndView.addObject("result", "false");
		}
		modelAndView.setViewName("/common/ajaxResult");
		return modelAndView;
	}
	
	@GetMapping("/add")
	public ModelAndView setMemberAdd() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/add");
		return modelAndView;
	}
	
	@PostMapping("/add")
	public ModelAndView setMemberAdd(MemberDTO memberDTO) {
		ModelAndView modelAndView = new ModelAndView();
		
		int result = memberService.setMemberAdd(memberDTO);
		if(result > 0) {
			modelAndView.addObject("message", "회원가입을 축하드립니다");
		}else {
			modelAndView.addObject("message", "회원가입 오류 발생했습니다");
		}
		modelAndView.addObject("url", "/");
		modelAndView.setViewName("/common/result");
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
