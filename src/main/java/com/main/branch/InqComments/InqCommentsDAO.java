package com.main.branch.InqComments;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InqCommentsDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.main.branch.InqComments.";
	
	public List<InqCommentsDTO> getInqCommentsList(InqCommentsDTO inqCommentsDTO){
		return sqlSession.selectList(NAMESPACE + "getInqCommentsList", inqCommentsDTO);
	}
	
}
