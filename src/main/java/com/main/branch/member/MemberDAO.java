package com.main.branch.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.main.branch.member.MemberDAO.";
	
	public String getMemberFindId(MemberDTO memberDTO) {
		return sqlSession.selectOne(NAMESPACE + "getMemberFindId", memberDTO);
	}
	public int setMemberUpdatePw(MemberDTO memberDTO) {
		return sqlSession.update(NAMESPACE + "setMemberUpdatePw", memberDTO);
	}
	
	public List<MemberDTO> getMemberList(){
		return sqlSession.selectList(NAMESPACE + "getMemberList");
	}
	public int setMemberAdd(MemberDTO memberDTO) {
		return sqlSession.insert(NAMESPACE + "setMemberAdd", memberDTO);
	}
	public MemberDTO getMemberDetail(MemberDTO memberDTO) {
		return sqlSession.selectOne(NAMESPACE + "getMemberDetail", memberDTO);
	}
	public int setMemberUpdate(MemberDTO memberDTO) {
		return sqlSession.update(NAMESPACE + "setMemberUpdate", memberDTO);
	}
	public int setMemberDelete(MemberDTO memberDTO) {
		return sqlSession.delete(NAMESPACE + "setMemberDelete", memberDTO);
	}
	public int setMemberHitUpdate(MemberDTO memberDTO) {
		return sqlSession.update(NAMESPACE + "setMemberHitUpdate", memberDTO);
	}
}
