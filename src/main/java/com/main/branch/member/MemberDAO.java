package com.main.branch.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.main.branch.member.";
	
	public List<MemberDTO> getMemberList(){
		return sqlSession.selectList(NAMESPACE + "getMemberList");
	}
}
