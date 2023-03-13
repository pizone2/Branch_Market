package com.main.branch.Comments;

import static org.junit.Assert.*;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.main.branch.comments.CommentsDAO;
import com.main.branch.comments.CommentsDTO;
import com.main.branch.util.Pager;

public class CommentDAOTest extends MyTestCase {

	@Autowired
	private SqlSession sqlSession;
	private CommentsDAO commentsDAO;

	@Test
	public void getCommentsListTest()throws Exception{
		Pager pager = new Pager();
		pager.setPage(1);
		pager.setPerPage(10);
		
		List<CommentsDTO> commentsList = sqlSession.selectList("getCommentsList", pager);
		
		assertEquals((int)pager.getPerPage(),commentsList.size());

	}
}
