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
	
	public Integer setProductAdd(ProductDTO productDTO, MultipartFile [] files) throws Exception{
		Integer result;
		// ----------- 나중에 주석 해제
//		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
//		productDTO.setMemberId(memberDTO.getMemberId());
		productDTO.setMemberId("이주형");
		if(files.length != 0) { //pic.getSize() !=0
			
			//1. File을 HDD에 저장 경로
			// Project 경로가 아닌 OS가 이용하는 경로
			String realPath = servletContext.getRealPath("resources/upload/product");
			System.out.println(realPath);
			
			String fileName = fileManager.fileSave(files[0], realPath);
			productDTO.setProductImgName(fileName);

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
	
	public Integer setProductUpdate(ProductDTO productDTO) throws Exception{
		return productDAO.setProductUpdate(productDTO);
	}
	
	public Integer setProductRequest(ProductDTO productDTO) throws Exception{
		return productDAO.setProductRequest(productDTO);
	}
	
	public Integer setProductAddConfirm(ProductDTO productDTO) throws Exception{
		return productDAO.setProductAddConfirm(productDTO);
	}
	
	public Integer setProductRequestList(ProductDTO productDTO) throws Exception{
		return productDAO.setProductRequestList(productDTO);
	}
	
}
