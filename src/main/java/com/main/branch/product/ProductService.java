package com.main.branch.product;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.main.branch.member.MemberDTO;
import com.main.branch.util.FileManager;
import com.main.branch.util.Pager;

@Service
public class ProductService {

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private HttpSession httpSession;
	
	public List<ProductDTO> getProductList(Pager pager) throws Exception{
		
		Integer totalCount = productDAO.getProductCount(pager);
		
		pager.makeNum(totalCount);
		pager.makeRow();
		
		return productDAO.getProductList(pager);
	}
	
	public ProductDTO getProductDetail(ProductDTO productDTO) throws Exception{
		return productDAO.getProductDetail(productDTO);
	}
	
	public Integer setProductAdd(ProductDTO productDTO, MultipartFile filecs) throws Exception{
		Integer result;
		// ----------- 나중에 주석 해제
//		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
//		productDTO.setMemberId(memberDTO.getMemberId());
		productDTO.setMemberId("이주형");
		
		if(!filecs.isEmpty()) { //pic.getSize() !=0
			
			//1. File을 HDD에 저장 경로
			// Project 경로가 아닌 OS가 이용하는 경로
			String realPath = servletContext.getRealPath("resources/upload/product");
			System.out.println(realPath);
			
			String fileName = fileManager.fileSave(filecs, realPath);
			productDTO.setProductImgName("/resources/upload/product/"+fileName);
			System.out.println(filecs);
			System.out.println(filecs.getOriginalFilename());
			//2. DB에 저장
			
			result = productDAO.setProductAdd(productDTO);
		}
		else {
			result = productDAO.setProductAdd(productDTO);
		}
		return result;
	}
	
	public Integer setProductDelete(ProductDTO productDTO) throws Exception{
		return productDAO.setProductDelete(productDTO);
	}
	
	public Integer setProductUpdate(ProductDTO productDTO, MultipartFile [] files) throws Exception{
		Integer result;
		// ----------- 나중에 주석 해제
//		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
//		productDTO.setMemberId(memberDTO.getMemberId());
		productDTO.setMemberId("이주형");
		
		result = productDAO.setProductUpdate(productDTO);
		return result;
	}

	public List<ProductDTO> getProductAddList(Pager pager) throws Exception{
		
		Integer totalCount = productDAO.getProductCount(pager);
		
		pager.makeNum(totalCount);
		pager.makeRow();
		
		return productDAO.getProductAddList(pager);
	}
	
	public Integer setProductAddConfirm(ProductDTO productDTO) throws Exception{
		return productDAO.setProductAddConfirm(productDTO);
	}
	
}
