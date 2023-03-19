package com.main.branch.kakaoPay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/kakaoPay")
public class KakaoPayController {
    
    @Autowired
    private KakaoPayService kakaoService;
    
    
    @PostMapping("/ready")
    public String ready() {
		return "redirect:" + kakaoService.ready();
    }
    
    @GetMapping("/approval")
    public String approval(String pg_token) {
       KakaoPayApprovalVO kakaoPayApprovalVO = kakaoService.approval(pg_token);
       // 이 정보들 가지고 사용자 결제내역 db insert
       System.out.println(kakaoPayApprovalVO.toString());
       System.out.println(kakaoPayApprovalVO.getAmount().getTotal());
       
       return "redirect: " + "/";
    }
    @GetMapping("/cancel")
    public void cancel(String pg_token) {
        
        
    }
    @GetMapping("/fail")
    public void fail(String pg_token) {
        
        
    }
    
}