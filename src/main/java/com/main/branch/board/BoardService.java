package com.main.branch.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.branch.util.Pager;

@Service
public class BoardService {
	@Autowired
	private BoardDAO boardDAO;
	
	public List<BoardDTO> getBoardList (Pager pager) throws Exception{
		pager.setPerPage(10);
		pager.makeRow();
		pager.makeNum(boardDAO.getTotalCount(pager));
		return boardDAO.getBoardList(pager);
	}
	
	public BoardDTO getBoardDetail(BoardDTO boardDTO) throws Exception{
		return boardDAO.getBoardDetail(boardDTO);
	}
	
	public int SetBoardAdd(BoardDTO boardDTO) throws Exception{
		return boardDAO.setBoardAdd(boardDTO);
	}
	
	public int setBoardDelete(BoardDTO boardDTO) throws Exception{
		return boardDAO.setBoardDelete(boardDTO);
	}
	
	public int setBoardUpdate(BoardDTO boardDTO) throws Exception{
		return boardDAO.setBoardUpdate(boardDTO);
	}
	
	//-----------------------------
	public int SetBoardPicAdd(BoardPicDTO boardPicDTO) throws Exception{
		return boardDAO.setBoardPicAdd(boardPicDTO);
	}
	public int setBoardPicDelete(BoardPicDTO boardPicDTO) throws Exception{
		return boardDAO.setBoardPicDelete(boardPicDTO);
	}
}
