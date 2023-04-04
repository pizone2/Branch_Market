package com.main.branch.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.main.branch.member.MemberDTO;
import com.main.branch.util.FileManager;
import com.main.branch.util.Pager;
import com.main.branch.util.Parser;

@Service
public class BoardService {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private FileManager fileManager;
	
	public List<BoardDTO> getBoardList (Pager pager) throws Exception{
		pager.makeRow();
		pager.makeNum(boardDAO.getTotalCount(pager));
		return boardDAO.getBoardList(pager);
	}
	
	public BoardDTO getBoardDetail(BoardDTO boardDTO) throws Exception{
		boardDAO.setBoardHitAdd(boardDTO);
		return boardDAO.getBoardDetail(boardDTO);
	}
	
	public int SetBoardAdd(BoardDTO boardDTO, MultipartFile multipartFile) throws Exception{
		int result = boardDAO.setBoardAdd(boardDTO);
		if(!multipartFile.isEmpty()) {//multipartFile.getSize()!=0
		      //1. File을 HDD에 저장
		      //   Project 경로가 아닌 OS가 이용하는 경로
		      String path = servletContext.getRealPath("resources/upload/board");
		      System.out.println(path);
		      String fileName = fileManager.fileSave(multipartFile,path);
		      
		      //2. DB에 저장
		      BoardImgDTO boardImgDTO = new BoardImgDTO();
		      boardImgDTO.setFileName(fileName);
		      boardImgDTO.setOriName(multipartFile.getOriginalFilename());
		      boardImgDTO.setBookNum(boardImgDTO.getBookNum());
		      
		      result = boardDAO.setBoardImgAdd(boardImgDTO);
		      }
		      return result;
	}
	
	public int setBoardDelete(BoardDTO boardDTO) throws Exception{
		return boardDAO.setBoardDelete(boardDTO);
	}
	
	public int setBoardUpdate(BoardDTO boardDTO) throws Exception{
		return boardDAO.setBoardUpdate(boardDTO);
	}
	public List<BoardDTO> getBoardSellTopList()throws Exception{
		List<BoardDTO> boardDTOs = boardDAO.getBoardSellTopList();
		
		for(BoardDTO boardDTO : boardDTOs) {
			String contents = boardDTO.getBoardContents();
			contents = Parser.html2text(contents);
			contents = Parser.longStringToShort(contents);
			boardDTO.setBoardContents(contents);
		}
		return boardDTOs;
	}
	public List<BoardDTO> getBoardBuyTopList()throws Exception{
		List<BoardDTO> boardDTOs = boardDAO.getBoardBuyTopList();
		
		for(BoardDTO boardDTO : boardDTOs) {
			String contents = boardDTO.getBoardContents();
			contents = Parser.html2text(contents);
			contents = Parser.longStringToShort(contents);
			boardDTO.setBoardContents(contents);
		}
		return boardDTOs;
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
