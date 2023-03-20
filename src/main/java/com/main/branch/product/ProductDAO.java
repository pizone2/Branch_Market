package com.main.branch.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.branch.member.MemberDTO;
import com.main.branch.util.Pager;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.main.branch.product.ProductDAO.";
	
	public Integer getProductCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getProductCount", pager);
	}
	
	public List<ProductDTO> getProductList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE + "getProductList", pager);
	}
	
	public ProductDTO getProductDetail(ProductDTO productDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getProductDetail", productDTO);
	}
	
	public Integer setProductAdd(ProductDTO productDTO) throws Exception{
		return sqlSession.insert(NAMESPACE + "setProductAdd", productDTO);
	}
	
	public Integer setProductDelete(ProductDTO productDTO) throws Exception{
		return sqlSession.delete(NAMESPACE + "setProductDelete", productDTO);
	}
	
	public Integer setProductUpdate(ProductDTO productDTO) throws Exception{
		return sqlSession.update(NAMESPACE + "setProductUpdate", productDTO);
	}
	
	public List<ProductDTO> getProductAddList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE + "getProductAddList", pager);
	}
	
	public Integer setProductAddConfirm(ProductDTO productDTO) throws Exception{	//신청확인 DB저장
		return sqlSession.update(NAMESPACE + "setProductAddConfirm", productDTO);
	}
	
	public Integer getProductAddCount(Pager pager)throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getProductAddCount", pager);
	}
	
}	