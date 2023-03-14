package com.main.branch.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.branch.util.Pager;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.main.branch.board.BoardDAO.";
	
	public Integer getTotalCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pager);
	}
	
	public List<BoardDTO> getBoardList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getBoardList", pager);
	}
	
	public BoardDTO getBoardDetail(BoardDTO boardDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getBoardDetail", boardDTO);
	}
	
	public int setBoardAdd(BoardDTO boardDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setBoardAdd", boardDTO);
	}

}