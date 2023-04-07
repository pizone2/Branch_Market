package com.main.branch.board;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

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
		/*
		 * List<BoardDTO> dtos = boardDAO.getBoardList(pager); Set<BoardDTO> indexs =
		 * new HashSet<BoardDTO>(); //들어간 data 정리 int maxSize = Math.min(dtos.size(),4);
		 */
		/*
		 * while(indexs.size()<maxSize) { //int index = random(0,dtos.size());//index를
		 * 랜덤으로 int index = (int)(Math.random()*dtos.size()+1); //if(index == )
		 * continue; //set을 비교했을때 같으면 continue boardDTO = dtos[index]; //index를 뽑아서 해당
		 * index의 DTO를 indexs.add(boardDTO); //indexs에 넣음 }
		 */
		
		
		
		boardDAO.setBoardHitAdd(boardDTO);
		return boardDAO.getBoardDetail(boardDTO);
	}
	
	public int SetBoardAdd(BoardDTO boardDTO, MultipartFile [] multipartFiles, HttpSession session) throws Exception{
		int result = boardDAO.setBoardAdd(boardDTO);
		String path = session.getServletContext().getRealPath("resources/upload/board");
		System.out.println(path);
			for(MultipartFile multipartFile : multipartFiles) {
				if(multipartFile.isEmpty()) {
					System.out.println("check");
					continue;
				}
				System.out.println(boardDTO.getBoardNum());
		      String fileName = fileManager.fileSave(multipartFile,path);
		      
		      //2. DB에 저장
		      BoardImgDTO boardImgDTO = new BoardImgDTO();
		      boardImgDTO.setFileName(fileName);
		      boardImgDTO.setOriName(multipartFile.getOriginalFilename());
		      boardImgDTO.setBoardNum(boardDTO.getBoardNum());
		      
		      result = boardDAO.setBoardImgAdd(boardImgDTO);
		      }
		      return result;
	}

	
	public int setBoardUpdate(BoardDTO boardDTO, MultipartFile [] multipartFiles, HttpSession session) throws Exception{
		int result =  boardDAO.setBoardUpdate(boardDTO);
		
		String path = session.getServletContext().getRealPath("resources/upload/board");
		System.out.println(path);
		if(multipartFiles != null) {
			for(MultipartFile multipartFile : multipartFiles) {
				if(multipartFile.isEmpty()) {
					System.out.println("check");
					continue;
				}
				System.out.println(boardDTO.getBoardNum());
		      String fileName = fileManager.fileSave(multipartFile,path);
		      
		      //2. DB에 저장
		      BoardImgDTO boardImgDTO = new BoardImgDTO();
		      boardImgDTO.setFileName(fileName);
		      boardImgDTO.setOriName(multipartFile.getOriginalFilename());
		      boardImgDTO.setBoardNum(boardDTO.getBoardNum());
		      
		      result = boardDAO.setBoardImgAdd(boardImgDTO);
		      }
		}
      return result;
	}
	
	public int setBoardImgDelete(Integer fileNum) throws Exception{
		return boardDAO.setBoardImgDelete(fileNum);
	}
	
	public int setBoardDelete(BoardDTO boardDTO, HttpSession session) throws Exception{
		List<BoardImgDTO> ar = boardDAO.getBoardImgList(boardDTO);
		int result = boardDAO.setBoardDelete(boardDTO);
		
		if(result>0) {
			String realPath = session.getServletContext().getRealPath("resources/upload/board");
			for(BoardImgDTO boardImgDTO : ar) {
			boolean check = fileManager.fileDelete(realPath, boardImgDTO.getFileName());
			}
		}
		
		return result;
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
	public int getMyBoardPicTotalCount() {
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		if(memberDTO == null) {
			return 0;
		}else {
			return boardDAO.getMyBoardPicTotalCount(memberDTO);
		}
	}
}
