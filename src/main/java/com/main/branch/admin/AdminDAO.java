package com.main.branch.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.branch.member.MemberDTO;
import com.main.branch.util.Pager;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.main.branch.admin.AdminDAO.";
	
	public List<MemberDTO> getMemberList(Pager pager){
		return sqlSession.selectList(NAMESPACE + "getMemberList", pager);
	}
	public int getMemberCount(Pager pager) {
		return sqlSession.selectOne(NAMESPACE + "getMemberCount",pager);
	}
	public int setAdminAdd(MemberDTO memberDTO) {
		return sqlSession.insert(NAMESPACE + "setAdminAdd", memberDTO);
	}
}
