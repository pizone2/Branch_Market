package com.main.branch.pay;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.branch.member.MemberDTO;
import com.main.branch.util.Pager;

@Repository
public class PayDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.main.branch.pay.PayDAO.";
	
	public int setPayAdd(PayDTO payDTO) {
		return sqlSession.insert(NAMESPACE + "setPayAdd", payDTO);
	}
	public List<PayDTO> getPayList(Pager pager){
		return sqlSession.selectList(NAMESPACE + "getPayList", pager);
	}
	public int getPayListCount(Pager pager) {
		return sqlSession.selectOne(NAMESPACE + "getPayListCount", pager);
	}
	public PayDTO getPayListDetail(PayDTO payDTO) {
		return sqlSession.selectOne(NAMESPACE + "getPayListDetail", payDTO);
	}
	
}
