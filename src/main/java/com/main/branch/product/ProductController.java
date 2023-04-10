package com.main.branch.product;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.board.BoardDTO;
import com.main.branch.board.BoardPicDTO;
import com.main.branch.member.MemberDTO;
import com.main.branch.util.Pager;

@Controller
@RequestMapping(value = "/product/**")
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	
	@GetMapping("list")
	public ModelAndView getProductList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<ProductDTO> ar = productService.getProductList(pager);
		mv.addObject("list", ar);
		mv.setViewName("product/list");
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getProductDetail(ProductDTO productDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		productDTO = productService.getProductDetail(productDTO);
		
		
		ProductPicDTO productPicDTO = productService.checkAlreadyProductPic(productDTO);
		if(productPicDTO == null) {
			mv.addObject("checkPic", 0);
		}else {
			mv.addObject("checkPic", 1);
		}
		
		List<ProductDTO> ar = productService.getProductResultList(productDTO);
	    mv.addObject("resultList", ar);
		    
		mv.setViewName("product/detail");
		mv.addObject("dto", productDTO);
		
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView setProductAdd(ModelAndView mv) throws Exception{
		mv.setViewName("product/add");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setProductAdd(ProductDTO productDTO, MultipartFile filecs, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
//		System.out.println("Name : "+files.get());
		System.out.println(session.getServletContext());
		
		Integer result = productService.setProductAdd(productDTO, filecs);
		
		mv.setViewName("redirect:./list");
		
		return mv;
		
	}
	
	@PostMapping("delete")
	public ModelAndView setProductDelete(ProductDTO productDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		Integer result = productService.setProductDelete(productDTO);
		
		String message = "삭제 실패";
		if(result>0) {
			message = "게시물이 삭제되었습니다";
		}
		mv.addObject("result", message);
		mv.addObject("url", "./list");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setProductUpdate(ProductDTO productDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		productDTO = productDAO.getProductDetail(productDTO);
		mv.setViewName("product/update");
		mv.addObject("dto", productDTO);
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setProductUpdate(ProductDTO productDTO, MultipartFile [] files) throws Exception{
		ModelAndView mv = new ModelAndView();
		Integer result = productService.setProductUpdate(productDTO, files);
		
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@GetMapping("addList")
	public ModelAndView setProductAddList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ProductDTO> ar = productService.getProductAddList(pager);
		mv.setViewName("product/addList");
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		
		return mv;
	}
	
	@PostMapping("addConfirm")
	public ModelAndView setProductAddConfirm(ProductDTO productDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		Integer result = productService.setProductAddConfirm(productDTO);
		
		mv.setViewName("redirect:../product/list");
		
		return mv;
	}
	
	@PostMapping("insertNaverData")
	public ModelAndView setInsertNaverData(ProductDTO productDTO)throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		
		int result = productService.setProductAdd(productDTO, null);
		result = productService.setProductAddConfirm(productDTO);
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/common/ajaxResult");
		return modelAndView;
	}
	
	@GetMapping("myList")
	public ModelAndView getProductMyList(Pager pager) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		pager.setMemberId(memberDTO.getMemberId());
		
		List<ProductDTO> productDTOs = productService.getProductMyList(pager);
		modelAndView.addObject("productDTOs", productDTOs);
		modelAndView.setViewName("/product/myList");
		
		return modelAndView;
	}
	
	@GetMapping("topList")
	public ModelAndView getProductTopList(Pager pager)throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		List<ProductDTO> productDTOs = productService.getProductTopList();
		modelAndView.addObject("productDTOs", productDTOs);
		modelAndView.setViewName("/product/topList");
		return modelAndView;
	}
	@GetMapping("recentProduct")
	public ModelAndView getRecentProduct() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		
		Cookie[] cookies = request.getCookies();
		String recentProduct = null;
		for(Cookie cookie : cookies) {
			System.out.println(cookie.getValue() + " + " + cookie.getName());
			if(cookie.getName().equals("recentProduct")) {
				recentProduct = cookie.getValue();
			}
		}	
		List<ProductDTO> productDTOs = new ArrayList<ProductDTO>();
		if(recentProduct != null) {
			String[] productNums =  recentProduct.split(":");
			for(String productNum : productNums) {
				ProductDTO productDTO = new ProductDTO();
				productDTO.setProductNum(Integer.parseInt(productNum));
				productDTO = productDAO.getProductDetail(productDTO);
				productDTOs.add(productDTO);
			}
		}
		Collections.reverse(productDTOs);
		modelAndView.addObject("productDTOs", productDTOs);
		modelAndView.setViewName("/product/recentProduct");
		return modelAndView;
	}
	
	// ajax
	@GetMapping("mySellList")
	public ModelAndView getProductMySellList(Pager pager) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		List<ProductDTO> productDTOs = productService.getProductMySellList(pager);
		modelAndView.addObject("productDTOs", productDTOs);
		modelAndView.setViewName("/common/mySellList");
		
		return modelAndView;
	}
	//----------------
	
	// ajax
	@PostMapping("picAdd")
	public ModelAndView setProductPicAdd(ProductPicDTO productPicDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = productService.setProductPicAdd(productPicDTO);
		mv.addObject("result",result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	// ajax
	@PostMapping("picDelete")
	public ModelAndView setProductPicDelete(ProductPicDTO productPicDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = productService.setProductPicDelete(productPicDTO);
		//mv.addObject("result",result);
		mv.setViewName("redirect: ./picList");
		return mv;
	}
	

	@GetMapping("picList")
	public ModelAndView getProductPicMyList(ProductPicDTO productPicDTO)throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		List<ProductDTO> productDTOs = productService.getProductPicMyList(productPicDTO);
		
		if(productDTOs == null) {
			modelAndView.addObject("checkPic", 0);
		}else {
			modelAndView.addObject("checkPic", 1);
		}
		
		modelAndView.addObject("productDTOs", productDTOs);
		modelAndView.setViewName("/product/picList");
		return modelAndView;
	}
	
	// ajax
	@PostMapping("myProductPicCount")
	public ModelAndView getMyProductPicCount() {
		ModelAndView modelAndView = new ModelAndView();
		
		int result = productService.getMyProductPicCount();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/common/ajaxResult");
		
		return modelAndView;
	}
	
	
}
