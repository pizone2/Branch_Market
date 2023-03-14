package com.main.branch.inquiry;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InquiryDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.main.branch.inquiry.InquiryDAO.";
	
	mapper 수정!!!!!!!!!!!
}
