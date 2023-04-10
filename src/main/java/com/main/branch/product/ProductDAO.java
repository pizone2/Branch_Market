package com.main.branch.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.branch.board.BoardDTO;
import com.main.branch.board.BoardPicDTO;
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

	
	public List<ProductDTO> getProductMyList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE + "getProductMyList", pager);
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
	public Integer setProductUpdateState(ProductDTO productDTO)throws Exception{
		return sqlSession.update(NAMESPACE + "setProductUpdateState", productDTO);
	}
	//----------------
	public List<ProductDTO> getProductAddList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE + "getProductAddList", pager);
	}
	
	public Integer setProductAddConfirm(ProductDTO productDTO) throws Exception{	//신청확인 DB저장
		return sqlSession.update(NAMESPACE + "setProductAddConfirm", productDTO);
	}
	
	public Integer getProductAddCount(Pager pager)throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getProductAddCount", pager);
	}
	
	public Integer setProductHit(ProductDTO productDTO) throws Exception{
		return sqlSession.update(NAMESPACE + "setProductHit", productDTO);
	}
	
	public List<ProductDTO> getProductTopList()throws Exception{
		return sqlSession.selectList(NAMESPACE + "getProductTopList", NAMESPACE);
	}
	
	public int getMyProductPicCount(MemberDTO memberDTO) {
		return sqlSession.selectOne(NAMESPACE + "getMyProductPicCount", memberDTO);
	}
	//----------------
	
	public int setProductPicAdd(ProductPicDTO productPicDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setProductPicAdd", productPicDTO);
	}
	public int setProductPicDelete(ProductPicDTO productPicDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setProductPicDelete", productPicDTO);
	}
	public List<ProductPicDTO> getProductPicMyList(ProductPicDTO productPicDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE + "getProductPicMyList", productPicDTO);
	}
	public ProductPicDTO checkAlreadyProductPic(ProductDTO productDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE + "checkAlreadyProductPic", productDTO);
	}
}	