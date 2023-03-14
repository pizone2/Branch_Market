package com.main.branch.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.util.Pager;

@Controller
@RequestMapping(value = "/product/**")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@GetMapping("list")
	public ModelAndView getProductList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<ProductDTO> ar = productService.getProductList(pager);
		
		mv.setViewName("product/list");
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getProductDetail(ProductDTO productDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		productDTO = productService.getProductDetail(productDTO);
		
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
	public ModelAndView setProductAdd(ProductDTO productDTO, MultipartFile [] files, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
//		System.out.println("Name : "+files.get());
		System.out.println(session.getServletContext());
		
		Integer result = productService.setProductAdd(productDTO, files);
		
		mv.setViewName("redirect:./list");
		
		return mv;
		
	}
	
	@GetMapping("delete")
	public ModelAndView setProductDelete(ProductDTO productDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		Integer result = productService.setProductDelete(productDTO);
		
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setProductUpdate(ProductDTO productDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		productDTO = productService.getProductDetail(productDTO);
		mv.setViewName("product/update");
		mv.addObject("dto", productDTO);
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setProductUpdate(ProductDTO productDTO, ModelAndView mv) throws Exception{
		Integer result = productService.setProductUpdate(productDTO);
		
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@GetMapping("request")
	public ModelAndView setProductRequest(ProductDTO productDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("product/request");
		
		
		return mv;
	}
	
	@PostMapping
	public ModelAndView setProductAddConfirm(ProductDTO productDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("product/list");
		
		return mv;
	}
	
	@GetMapping("requestList")
	public ModelAndView setProductRequestList(ProductDTO productDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("product/list");
		
		return mv;
	}
	
}
