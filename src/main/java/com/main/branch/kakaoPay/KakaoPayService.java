package com.main.branch.kakaoPay;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

@Service
public class KakaoPayService {
 
    private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    private String adminKey = "";
    private String cid = "TC0ONETIME";
    private String partner_order_id = "1001"; // 해시로 처리
    private String approval_url = "http://localhost/kakaoPay/approval";
    private String cancel_url = "http://localhost/kakaoPay/cancel";
    private String fail_url = "http://localhost/kakaoPay/fail";
    
    
    public String ready() {
        RestTemplate restTemplate = new RestTemplate();
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + adminKey);
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body 나중에 변수로 다 수정
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", cid);
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "leejuhu"); // session
        params.add("item_name", "선물!!"); // dto
        params.add("quantity", "2"); // dto
        params.add("total_amount", "120"); // dto
        params.add("tax_free_amount", "100"); // dto
        params.add("approval_url", "http://localhost/kakaoPay/approval");
        params.add("cancel_url", "http://localhost/kakaoPay/cancel");
        params.add("fail_url", "http://localhost/kakaoPay/fail");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);           
            System.out.println("ready tid:  " + kakaoPayReadyVO.getTid());
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
        
    }
    
    public KakaoPayApprovalVO approval(String pg_token) {

        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + adminKey);
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid()); // 원래 db나 세션으로 받아야함
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "leejuhu");
        params.add("pg_token", pg_token);
        params.add("total_amount", "120");
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);

            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }
    
}