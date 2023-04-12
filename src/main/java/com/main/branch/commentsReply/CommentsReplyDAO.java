package com.main.branch.commentsReply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentsReplyDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.main.branch.commentsReply.CommentsReplyDAO.";	
	
	//List
	
	public List<CommentsReplyDTO> getCommentsReplyList(CommentsReplyDTO commentsReplyDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCommentsReplyList", commentsReplyDTO);
	}
	
	//Update
	public int setCommentsReplyUpdate(CommentsReplyDTO commentsReplyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"setCommentsReplyUpdate", commentsReplyDTO);
	}
	
	//Delete
	public int setCommentsReplyDelete(CommentsReplyDTO commentsReplyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setCommentsReplyDelete", commentsReplyDTO);
	}
	
	//Insert
	public int setCommentsReplyAdd(CommentsReplyDTO commentsReplyDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setCommentsReplyAdd", commentsReplyDTO);
	}
	public CommentsReplyDTO getCommentsDetail(CommentsReplyDTO commentsReplyDTO) {
		return sqlSession.selectOne(NAMESPACE + "getCommentsDetail", commentsReplyDTO);
	}
	
	
	
}
