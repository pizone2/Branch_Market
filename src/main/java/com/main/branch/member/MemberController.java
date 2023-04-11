package com.main.branch.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.util.ApiCallManager;
import com.main.branch.util.Naver;
import com.main.branch.util.Pager;
import org.springframework.http.HttpHeaders;

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
	
	// --------------------- findPw
	@GetMapping("/member/findPw")
	public ModelAndView getMemberFindPw() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/findPw");
		return modelAndView;
	}
	
	// memberId, email 입력받음
	@PostMapping("/member/findPw")
	public ModelAndView getMemberFindPw(MemberDTO memberDTO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		String message = "";
		String url = "/";
		int result = memberService.getMemberFindPw(memberDTO);
		if(result > 0) {
			message = "이메일에 비밀번호를 성공적으로 보냄!";
		}else {
			message = "존재하지 않는 아이디 또는 이메일 입니다";
			url = "./findPw";
		}
		
		modelAndView.addObject("message", message);
		modelAndView.addObject("url", url);
		modelAndView.setViewName("/common/result");
		
		return modelAndView;
	}
	
	// --------------------- findID
	@GetMapping("/member/findId")
	public ModelAndView getMemberFindId() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/findId");
		return modelAndView;
	}
	
	@PostMapping("/member/findId")
	public ModelAndView getMemberFindId(MemberDTO memberDTO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		int result = memberService.getMemberFindId(memberDTO);
		if(result > 0) {
			modelAndView.addObject("message", "이메일에 아이디 성공적으로 보냄!");
		}else {
			modelAndView.addObject("message", "이메일에 아이디를 보내지 못함!");
		}
		
		modelAndView.addObject("url", "/");
		modelAndView.setViewName("/common/result");
		
		return modelAndView;
	}
	
	// --------------------- updatePw
	@GetMapping("/updatePw")
	public ModelAndView setMemberUpdatePw(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/updatePw");
		return modelAndView;
	}
	
	@PostMapping("/updatePw")
	public ModelAndView setMemberUpdatePw(MemberDTO memberDTO){
		ModelAndView modelAndView = new ModelAndView();
		MemberDTO memberDTO2 = (MemberDTO) httpSession.getAttribute("member");
		
		String message = "";
		String url = "/";
		if(memberDTO2 == null) {
			message = "로그인 먼저 하세요";
			url = "./login";
		}else {
			memberDTO.setMemberId(memberDTO2.getMemberId());
			int result = memberService.setMemberUpdatePw(memberDTO);
			if(result > 0) {
				message = "비밀번호 업데이트 완료!";
			}else {
				message = "비밀번호 업데이트 실패!";
				url = "./updatePw";
			}
		}
		
		modelAndView.addObject("message", message);
		modelAndView.addObject("url", url);
		modelAndView.setViewName("/common/result");
		return modelAndView;
	}
	
	// --------------------- memberDelete
	@PostMapping("/delete")
	public ModelAndView setMemberDelete() {
		ModelAndView modelAndView = new ModelAndView();
		
		int result = memberService.setMemberDelete();
		if(result > 0) {
			modelAndView.addObject("message", "회원 탈퇴가 완료되었습니다");
		}else {
			modelAndView.addObject("message", "회원 탈퇴 오류 발생했습니다");
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
		ModelAndView modelAndView = new ModelAndView();
		Cookie cookie = new Cookie("cookieMemberId", memberDTO.getMemberId());
		if(cookieMemberId != null && cookieMemberId.equals("cookieMemberId")) {
			cookie.setPath("/");
			cookie.setMaxAge(60*60*24*7);
			response.addCookie(cookie);
		}else {
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		
		memberDTO = memberService.setMemberLogin(memberDTO);
		if(memberDTO != null) {
			httpSession.setAttribute("member", memberDTO);
			httpSession.setAttribute("id", memberDTO.getMemberId());
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
	
	@GetMapping("/myPage")
	public ModelAndView getMemberMyPage(MemberDTO memberDTO) {
		ModelAndView modelAndView = new ModelAndView();
		if(memberDTO.getMemberId() == null) {
			memberDTO = (MemberDTO) httpSession.getAttribute("member");
			memberDTO = memberService.getMemberDetail(memberDTO);
		}else {
			memberDTO = memberService.getMemberDetail(memberDTO);
		}
		
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.setViewName("/member/myPage");
		return modelAndView;
	}
	
	@PostMapping("/hitUpdate")
	public ModelAndView setMemberHitUpdate(MemberDTO memberDTO) {
		ModelAndView modelAndView = new ModelAndView();
		
		int result = memberService.setMemberHitUpdate(memberDTO);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/common/ajaxResult");
		
		return modelAndView;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// -------------------------테스트 전용---------------------------------
	
	@Autowired
	private MailSender mailSender;
	
	@GetMapping("/test")
	public ModelAndView test() {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("/member/test");
		return modelAndView;
	}
	
	@GetMapping("/payTest")
	public ModelAndView payTest() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/member/payTest");
		return modelAndView;
	}
	@PostMapping("/payTest")
	public ModelAndView payTest(String merchant_uid ) {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println(merchant_uid);
		modelAndView.setViewName("/common/result");
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
	
	@GetMapping("/getNaverData")
	public ModelAndView getNaverData(Pager pager) {
		ModelAndView modelAndView = new ModelAndView();
		
		pager.setPage(1); // 페이지 번호
		pager.setPerPage(100); // 페이지당 몇개 보여줄지 10~100
		pager.makeRow();
		// pager.setSearch("장난감"); // 사용자 검색어 pager에 이미 있음
		// Client ID, Client Secret
		String datas = Naver.getShoppingData("eFIJY0Ok7qZfi_ryWCOt", "RQHegogpKg", pager);
		modelAndView.addObject("result", datas);
		modelAndView.setViewName("/common/ajaxResult");
		return modelAndView;
	}
	
//	@GetMapping("/payComplete")
//	public ModelAndView payTest(String merchant_uid,String amount) {
//		ModelAndView modelAndView = new ModelAndView();
//		
//		System.out.println(merchant_uid);
//		System.out.println(amount);
//		
//		Map<String, String> params = new HashMap<String, String>();
//		
//		params.put("merchant_uid", merchant_uid);
//		params.put("amount", amount);
//		String message =  ApiCallManager.post("https://api.iamport.kr/payments/prepare", null, params);
//		modelAndView.addObject("message", message);
//		modelAndView.setViewName("/common/result");
//		return modelAndView;
//	}
	// -------------------------테스트 전용---------------------------------
}
