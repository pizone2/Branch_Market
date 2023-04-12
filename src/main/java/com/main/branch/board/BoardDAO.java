package com.main.branch.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.branch.member.MemberDTO;
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
	
	public int setBoardDelete(BoardDTO boardDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setBoardDelete", boardDTO);
	}
	
	public int setBoardUpdate(BoardDTO boardDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setBoardUpdate", boardDTO);
	}
	public int setBoardHitAdd(BoardDTO boardDTO)throws Exception{
		return sqlSession.update(NAMESPACE + "setBoardHitAdd", boardDTO);
	}
	public List<BoardDTO> getBoardSellTopList()throws Exception{
		return sqlSession.selectList(NAMESPACE + "getBoardSellTopList");
	}
	public List<BoardDTO> getBoardBuyTopList() throws Exception{
		return sqlSession.selectList(NAMESPACE + "getBoardBuyTopList");
	}
	
	//----------------------------------
	
	public int setBoardPicAdd(BoardPicDTO boardPicDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setBoardPicAdd", boardPicDTO);
	}
	public int setBoardPicDelete(BoardPicDTO boardPicDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setBoardPicDelete", boardPicDTO);
	}
	public List<BoardPicDTO> getBoardPicList(BoardPicDTO boardPicDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE + "getBoardPicList", boardPicDTO);
	}
	public BoardPicDTO checkAlreadyBoardPic(BoardDTO boardDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE + "checkAlreadyBoardPic", boardDTO);
	}
	
	//----------------------------------
	public List<BoardImgDTO> getBoardImgList(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getBoardImgList", boardDTO);
	}
	
	public int setBoardImgAdd(BoardImgDTO boardImgDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setBoardImgAdd", boardImgDTO);
	}
	
	public int setBoardImgDelete(Integer fileNum) throws Exception{
		return sqlSession.insert(NAMESPACE+"setBoardImgDelete", fileNum);
	}
	public int getMyBoardPicTotalCount(MemberDTO memberDTO) {
		return sqlSession.selectOne(NAMESPACE + "getMyBoardPicTotalCount", memberDTO);
	}
}
