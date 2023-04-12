package com.main.branch.InqComments;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.branch.util.Pager;

@Repository
public class InqCommentsDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.main.branch.InqComments.";
	
	public List<InqCommentsDTO> getInqCommentsList(Pager pager){
		return sqlSession.selectList(NAMESPACE + "getInqCommentsList", pager);
	}
	public int getInqCommentsCount(Pager pager) {
		return sqlSession.selectOne(NAMESPACE + "getInqCommentsCount", pager);
	}
	public int setInqCommentsAdd(InqCommentsDTO inqCommentsDTO) {
		return sqlSession.insert(NAMESPACE + "setInqCommentsAdd", inqCommentsDTO);
	}
	public int setInqCommentsUpdate(InqCommentsDTO inqCommentsDTO) {
		return sqlSession.update(NAMESPACE + "setInqCommentsUpdate", inqCommentsDTO);
	}
	public int setInqCommentsDelete(InqCommentsDTO inqCommentsDTO) {
		return sqlSession.delete(NAMESPACE + "setInqCommentsDelete", inqCommentsDTO);
	}
	public InqCommentsDTO getInqCommentsDetail(InqCommentsDTO inqCommentsDTO) {
		return sqlSession.selectOne(NAMESPACE + "getInqCommentsDetail", inqCommentsDTO);
	}
}
