package com.main.branch.inquiry;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.branch.util.Pager;

@Repository
public class InquiryDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.main.branch.inquiry.InquiryDAO.";
	
	public List<InquiryDTO> getInquiryList(Pager pager){
		return sqlSession.selectList(NAMESPACE + "getInquiryList", pager);
	}
	
	public int getInquiryCount(Pager pager) {
		return sqlSession.selectOne(NAMESPACE + "getInquiryCount", pager);
	}
	
	public int setInquriyUpdate(InquiryDTO inquiryDTO) {
		return sqlSession.update(NAMESPACE + "setInquriyUpdate", inquiryDTO);
	}
	public int setInquriyAdd(InquiryDTO inquiryDTO) {
		return sqlSession.insert(NAMESPACE + "setInquriyAdd", inquiryDTO);
	}
	public InquiryDTO getInquriyDetail(InquiryDTO inquiryDTO){
		return sqlSession.selectOne(NAMESPACE + "getInquriyDetail", inquiryDTO);
	}
	public int setInquiryDelete(InquiryDTO inquiryDTO) {
		return sqlSession.delete(NAMESPACE + "setInquiryDelete", inquiryDTO);
	}
	public InquiryDTO getInquriyDetailRowNum(InquiryDTO inquiryDTO) {
		return sqlSession.selectOne(NAMESPACE + "getInquriyDetailRowNum", inquiryDTO);
	}
}
