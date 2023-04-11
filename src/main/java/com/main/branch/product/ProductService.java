package com.main.branch.product;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.main.branch.board.BoardDTO;
import com.main.branch.board.BoardPicDTO;
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
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	public List<ProductDTO> getProductList(Pager pager) throws Exception{
		
		pager.setState("0");
		pager.setPerPage(12);
		pager.makeNum(productDAO.getProductCount(pager));
		pager.makeRow();
		return productDAO.getProductList(pager);
	}
	
	public List<ProductDTO> getProductMyList(Pager pager) throws Exception{
		
		pager.makeNum(productDAO.getProductCount(pager));
		pager.makeRow();
		
		return productDAO.getProductMyList(pager);
	}
	
	public List<ProductDTO> getProductResultList(ProductDTO productDTO) throws Exception {
		Pager pager = new Pager();
		pager.makeNum(productDAO.getProductCount(pager));
		pager.setStartRow(1);
		pager.setLastRow(productDAO.getProductCount(pager));
		
	    List<ProductDTO> allProducts = productDAO.getProductList(pager);
	    List<ProductDTO> relatedProducts = new ArrayList<ProductDTO>();
	    
	    Set<ProductDTO> indexes = new HashSet<ProductDTO>();

	    for (ProductDTO p : allProducts) {
	        if (p.getProductCategory().equals(productDTO.getProductCategory()) && !p.getProductNum().equals(productDTO.getProductNum())) {
	            relatedProducts.add(p);
	        }
	    }

	    
	    int maxSize = Math.min(relatedProducts.size(), 4);
	    
	    while (indexes.size() < maxSize) {
	        Random random = new Random();
	        int index = random.nextInt(relatedProducts.size());
	        ProductDTO randomProduct = relatedProducts.get(index);

            indexes.add(randomProduct);
	    }
	    
	   
	    return new ArrayList<ProductDTO>(indexes);
	}
	
	public ProductDTO getProductDetail(ProductDTO productDTO) throws Exception{
	    ProductDTO productDetail = productDAO.getProductDetail(productDTO);
	    productDAO.setProductHit(productDTO);
	    productDAO.setProductUpdate(productDetail);
	    
		Cookie[] cookies = request.getCookies();
		String recentProduct = null;
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("recentProduct")) {
				recentProduct = cookie.getValue();
				recentProduct += (String.valueOf(productDTO.getProductNum()) + ":");
				String[]recentProducts = recentProduct.split(":");
				if(recentProducts.length > 5) {
					recentProduct = "";
					for(int i = recentProducts.length- 5;i < recentProducts.length;i++) {
						recentProduct += (recentProducts[i] + ":");
					}
				}
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24*7);
				cookie.setValue(recentProduct);
				response.addCookie(cookie);
			}
		}
		if(recentProduct == null) {
			Cookie cookie = new Cookie("recentProduct",String.valueOf(productDTO.getProductNum()) + ":" );
			cookie.setPath("/");
			cookie.setMaxAge(60*60*24*7);
			response.addCookie(cookie);
		}
	    
	    return productDetail;
	}
	
	public Integer setProductAdd(ProductDTO productDTO, MultipartFile filecs) throws Exception{
		Integer result;
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		productDTO.setMemberId(memberDTO.getMemberId());
		
		if(filecs != null) { //pic.getSize() !=0
			
			//1. File을 HDD에 저장 경로
			// Project 경로가 아닌 OS가 이용하는 경로
			String realPath = servletContext.getRealPath("resources/upload/product");
			System.out.println(realPath);
			
			String fileName = fileManager.fileSave(filecs, realPath);
			productDTO.setProductImgName("/resources/upload/product/"+fileName);
			System.out.println(filecs);
			System.out.println(filecs.getOriginalFilename());
		}
		
		return productDAO.setProductAdd(productDTO);
	}
	
	public Integer setProductDelete(ProductDTO productDTO) throws Exception{
		return productDAO.setProductDelete(productDTO);
	}
	
	public Integer setProductUpdate(ProductDTO productDTO, MultipartFile [] files) throws Exception{
		Integer result;
		// ----------- 나중에 주석 해제
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		productDTO.setMemberId(memberDTO.getMemberId());
		
		result = productDAO.setProductUpdate(productDTO);
		return result;
	}

	public List<ProductDTO> getProductAddList(Pager pager) throws Exception{
		
		Integer totalCount = productDAO.getProductAddCount(pager);
		
		pager.makeNum(totalCount);
		pager.makeRow();
		
		return productDAO.getProductAddList(pager);
	}
	
	public Integer setProductAddConfirm(ProductDTO productDTO) throws Exception{
		return productDAO.setProductAddConfirm(productDTO);
	}
	
	public List<ProductDTO> getProductTopList()throws Exception{
		return productDAO.getProductTopList();
	}
	public List<ProductDTO> getProductMySellList(Pager pager) throws Exception{
		pager.setState("0");
		pager.setPerPage(5);
		pager.makeNum(productDAO.getProductCount(pager));
		pager.makeRow();
		
		return productDAO.getProductList(pager);
	}
	//----------------------------
	
	public int setProductPicAdd(ProductPicDTO productPicDTO) throws Exception{
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		productPicDTO.setMemberId(memberDTO.getMemberId());
		
		return productDAO.setProductPicAdd(productPicDTO);
	}
	
	public int setProductPicDelete(ProductPicDTO productPicDTO) throws Exception{
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		productPicDTO.setMemberId(memberDTO.getMemberId());
		
		return productDAO.setProductPicDelete(productPicDTO);
	}
	
	public List<ProductDTO> getProductPicMyList(ProductPicDTO productPicDTO)throws Exception{
		// 멤버 아이디를 가져옴
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		productPicDTO.setMemberId(memberDTO.getMemberId());
		
		List<ProductPicDTO> productPicDTOs = productDAO.getProductPicMyList(productPicDTO);
		List<ProductDTO> productDTOs = new ArrayList<ProductDTO>();
		
		for(ProductPicDTO dto : productPicDTOs) {
			ProductDTO productDTO = new ProductDTO();
			productDTO.setProductNum(dto.getProductNum());
			productDTO = productDAO.getProductDetail(productDTO);
			productDTOs.add(productDTO);
		}
		
		return productDTOs;
	}
	
	public ProductPicDTO checkAlreadyProductPic(ProductDTO productDTO)throws Exception{
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		if(memberDTO == null)return null;
		else {
			productDTO.setMemberId(memberDTO.getMemberId());
			return productDAO.checkAlreadyProductPic(productDTO);
		}
	}
	// 판매 중 업데이트
	public Integer setProductUpdateState(ProductDTO productDTO)throws Exception{
		return productDAO.setProductUpdateState(productDTO);
	}
	
	public int getMyProductPicCount() {
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		if(memberDTO == null) {
			return 0;
		}else {
			return productDAO.getMyProductPicCount(memberDTO);
		}
	}
}
