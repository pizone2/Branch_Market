package com.main.branch.comments;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.branch.util.Pager;

@Repository
public class CommentsDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.main.branch.comments.CommentsDAO.";
	
	//List
	
	public List<CommentsDTO> getCommentsList(Pager pager)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCommentsList", pager);
	}
	
	//Update
	public int setCommentsUpdate(CommentsDTO commentsDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"setCommentsUpdate", commentsDTO);
	}
	
	//Delete
	public int setCommentsDelete(CommentsDTO commentsDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setCommentsDelete", commentsDTO);
	}
	
	//Insert
	public int setCommentsAdd(CommentsDTO commentsDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setCommentsAdd", commentsDTO);
	}
	
	//TotalCount??
	public int getTotalCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount",pager);
	}
	
	public CommentsDTO getCommentsDetail(CommentsDTO commentsDTO) {
		return sqlSession.selectOne(NAMESPACE + "getCommentsDetail", commentsDTO);
	}

	
}
