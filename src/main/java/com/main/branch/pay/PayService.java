package com.main.branch.pay;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.branch.member.MemberDTO;
import com.main.branch.product.ProductDAO;
import com.main.branch.product.ProductDTO;
import com.main.branch.product.ProductPicDTO;
import com.main.branch.product.ProductService;
import com.main.branch.util.Pager;

@Service
public class PayService {
	@Autowired
	private PayDAO payDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ProductService productService;
	@Autowired
	private HttpSession httpSession;
	
	public int setPayAdd(PayDTO payDTO) throws Exception {
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		payDTO.setMemberId(memberDTO.getMemberId());	
		
		String[] productNums = payDTO.getProductNums().split(",");
		
		for(String productNum : productNums) {
			// 장바구니 아이템 삭제
			ProductPicDTO productPicDTO = new ProductPicDTO();
			productPicDTO.setProductNum(Integer.parseInt(productNum));
			int result = productService.setProductPicDelete(productPicDTO);
			
			// 사용자가 구매한 아이템 상태변경
			ProductDTO temp = new ProductDTO();
			temp.setProductNum(Integer.parseInt(productNum));
			productService.setProductUpdateState(temp);
		}
		
		
		return payDAO.setPayAdd(payDTO);
	}
	
	public List<PayDTO> getPayList(Pager pager){
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		pager.setMemberId(memberDTO.getMemberId());
		
		pager.makeNum(payDAO.getPayListCount(pager));
		pager.makeRow();
		
		return payDAO.getPayList(pager);
	}
	
	// pk 하나 구해서 productNums 가져옴
	public List<ProductDTO> getPayListDetail(PayDTO payDTO) throws Exception{
		payDTO = payDAO.getPayListDetail(payDTO);
		
		List<ProductDTO> productDTOs = new ArrayList<ProductDTO>();
		String[] productNums = payDTO.getProductNums().split(",");
		
		for(String productNum : productNums) {
			ProductDTO productDTO = new ProductDTO();
			productDTO.setProductNum(Integer.parseInt(productNum));
			productDTO = productDAO.getProductDetail(productDTO);
			productDTOs.add(productDTO);
		}
		
		return productDTOs;
	}
}
