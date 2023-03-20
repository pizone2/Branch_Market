package com.main.branch.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.branch.member.MemberDTO;
import com.main.branch.util.Pager;

@Service
public class BoardService {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private HttpSession httpSession;
	
	public List<BoardDTO> getBoardList (Pager pager) throws Exception{
		pager.makeRow();
		pager.makeNum(boardDAO.getTotalCount(pager));
		return boardDAO.getBoardList(pager);
	}
	
	public BoardDTO getBoardDetail(BoardDTO boardDTO) throws Exception{
		boardDAO.setBoardHitAdd(boardDTO);
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
	public List<BoardDTO> getBoardTopList()throws Exception{
		return boardDAO.getBoardTopList();
	}
	
	//-----------------------------
	public int SetBoardPicAdd(BoardPicDTO boardPicDTO) throws Exception{
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		boardPicDTO.setMemberId(memberDTO.getMemberId());
		
		return boardDAO.setBoardPicAdd(boardPicDTO);
	}
	public int setBoardPicDelete(BoardPicDTO boardPicDTO) throws Exception{
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		boardPicDTO.setMemberId(memberDTO.getMemberId());
		
		return boardDAO.setBoardPicDelete(boardPicDTO);
	}
	
	public List<BoardDTO> getBoardMyPicList(BoardPicDTO boardPicDTO)throws Exception{
		// 멤버 아이디를 가져옴
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		boardPicDTO.setMemberId(memberDTO.getMemberId());
		
		List<BoardPicDTO> boardPicDTOs = boardDAO.getBoardPicList(boardPicDTO);
		List<BoardDTO> boardDTOs = new ArrayList<BoardDTO>();
		
		for(BoardPicDTO dto : boardPicDTOs) {
			BoardDTO boardDTO = new BoardDTO();
			boardDTO.setBoardNum(dto.getBoardNum());
			boardDTO = boardDAO.getBoardDetail(boardDTO);
			boardDTOs.add(boardDTO);
		}
		
		return boardDTOs;
	}
	public BoardPicDTO checkAlreadyBoardPic(BoardDTO boardDTO)throws Exception{
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		if(memberDTO == null)return null;
		else {
			boardDTO.setMemberId(memberDTO.getMemberId());
			return boardDAO.checkAlreadyBoardPic(boardDTO);
		}
	}
}
