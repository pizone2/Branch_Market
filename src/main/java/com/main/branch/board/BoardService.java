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
	
	
	public List<BoardDTO> getBoardResultList(BoardDTO boardDTO) throws Exception {
		Pager pager = new Pager();
		pager.makeNum(boardDAO.getTotalCount(pager));
		pager.setStartRow(1);
		pager.setLastRow(boardDAO.getTotalCount(pager));
		
	    List<BoardDTO> allBoards = boardDAO.getBoardList(pager);
	    List<BoardDTO> relatedBoards = new ArrayList<BoardDTO>();
	    
	    Set<BoardDTO> indexes = new HashSet<BoardDTO>();

	    for (BoardDTO p : allBoards) {
	        if (p.getBoardCategory().equals(boardDTO.getBoardCategory()) && !p.getBoardNum().equals(boardDTO.getBoardNum())) {
	            relatedBoards.add(p);
	        }
	    }
	    int maxSize = Math.min(relatedBoards.size(), 4);
	   // System.out.println(boardDTO.getBoardCategory()) + " " + relatedBoards.size());
	    while (indexes.size() < maxSize) {
	        Random random = new Random();
	        int index = random.nextInt(relatedBoards.size());
	        BoardDTO randomBoard = relatedBoards.get(index);
	        
	        randomBoard = boardDAO.getBoardDetail(randomBoard);
            indexes.add(randomBoard);
	    }
	    
	   
	    return new ArrayList<BoardDTO>(indexes);
	}
	
	public BoardDTO getBoardDetail(BoardDTO boardDTO) throws Exception{
		boardDAO.setBoardHitAdd(boardDTO);
		return boardDAO.getBoardDetail(boardDTO);
	}
	
	public int SetBoardAdd(BoardDTO boardDTO, MultipartFile [] multipartFiles, HttpSession session) throws Exception{
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		boardDTO.setMemberId(memberDTO.getMemberId());
		
		int result = boardDAO.setBoardAdd(boardDTO);
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
			if(ar != null) {
				for(BoardImgDTO boardImgDTO : ar) {
					fileManager.fileDelete(realPath, boardImgDTO.getFileName());
				}
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
