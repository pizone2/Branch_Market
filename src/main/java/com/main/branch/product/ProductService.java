package com.main.branch.product;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.main.branch.util.FileManager;
import com.main.branch.util.Pager;

@Service
public class ProductService {

	@Autowired
	private ProductDAO productDAO;

	public List<ProductDTO> getProductList(Pager pager) throws Exception{
		
		Integer totalCount = productDAO.getProductCount(pager);
		
		pager.makeNum(totalCount);
		pager.makeRow();
		
		return productDAO.getProductList(pager);
	}
	
	public ProductDTO getProductDetail(ProductDTO productDTO) throws Exception{
		return productDAO.getProductDetail(productDTO);
	}
	
	public Integer setProductAdd(ProductDTO productDTO) throws Exception{
		return productDAO.setProductAdd(productDTO);
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
	
}
