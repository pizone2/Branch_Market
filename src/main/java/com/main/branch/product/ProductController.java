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
	public ModelAndView setProductAdd(ProductDTO productDTO, MultipartFile filecs, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
//		System.out.println("Name : "+files.get());
		System.out.println(session.getServletContext());
		
		Integer result = productService.setProductAdd(productDTO, filecs);
		
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
		
		mv.setViewName("redirect:./list");
		
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
	
}
