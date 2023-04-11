package com.main.branch.pay;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.product.ProductDTO;
import com.main.branch.util.ApiCallManager;
import com.main.branch.util.Pager;

@Controller
@RequestMapping("/pay/**")
public class PayController {
	
	@Autowired
	private PayService payService;
	
	@PostMapping("/add")
	public ModelAndView setPayAdd(PayDTO payDTO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		int result = payService.setPayAdd(payDTO);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/common/ajaxResult");
		
		return modelAndView;
	}
	@GetMapping("/payList")
	public ModelAndView getPayList(Pager pager) {
		ModelAndView modelAndView = new ModelAndView();
		
		List<PayDTO> payDTOs = payService.getPayList(pager);
		modelAndView.addObject("payDTOs", payDTOs);
		modelAndView.setViewName("/pay/payList");
		
		return modelAndView;
	}
	
	// pk 하나 전달받고 productnum을 구해서 각각 가져옴
	@GetMapping("/payListDetail")
	public ModelAndView getPayListDetail(PayDTO payDTO) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		List<ProductDTO> productDTOs = payService.getPayListDetail(payDTO);
		modelAndView.addObject("productDTOs", productDTOs);
		modelAndView.setViewName("/pay/payListDetail");
		
		return modelAndView;
	}
	
	@PostMapping("/payPreCheck")
	public ModelAndView preCheck(String merchant_uid,String amount) {
		ModelAndView modelAndView = new ModelAndView();
		
//		$.ajax({
//		    async:false,
//		    url: "/pay/payPreCheck",
//		    method: "post",
//		    data: {
//		      merchant_uid: merchant_uid, // 가맹점 주문번호
//		      amount: totalPriceData, // 결제 예정금액
//		    },
//		    success:(res)=>{
//		      console.log(res);
//		    }
//		  })
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("merchant_uid", merchant_uid);
		params.put("amount", amount);
		String result = ApiCallManager.post("https://api.iamport.kr/payments/prepare",null, params);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/common/ajaxResult");
		
		return modelAndView;
	}
}
