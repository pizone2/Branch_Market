package com.main.branch.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.branch.util.Pager;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.main.branch.review.ReviewDAO.";
	
	public List<ReviewDTO> getReviewList(Pager pager){
		return sqlSession.selectList(NAMESPACE + "getReviewList", pager);
	}
	public int getReviewCount(Pager pager) {
		return sqlSession.selectOne(NAMESPACE + "getReviewCount", pager);
	}
	public int setReviewAdd(ReviewDTO reviewDTO) {
		return sqlSession.insert(NAMESPACE + "setReviewAdd", reviewDTO);
	}
	public int setReviewUpdate(ReviewDTO reviewDTO) {
		return sqlSession.update(NAMESPACE + "setReviewUpdate", reviewDTO);
	}
	public int setReviewDelete(ReviewDTO reviewDTO) {
		return sqlSession.delete(NAMESPACE + "setReviewDelete", reviewDTO);
	}
}
