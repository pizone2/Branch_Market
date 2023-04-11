package com.main.branch.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.member.MemberDTO;
import com.main.branch.util.Pager;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private HttpSession httpSession;
	
	@GetMapping("list")
	public ModelAndView getBoardList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> ar = boardService.getBoardList(pager);
		mv.addObject("list", ar);
		mv.setViewName("board/list");
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getBoardDetail(BoardDTO boardDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		BoardPicDTO boardPicDTO = boardService.checkAlreadyBoardPic(boardDTO);
		if(boardPicDTO == null) {
			mv.addObject("checkPic", 0);
		}else {
			mv.addObject("checkPic", 1);
		}
		
		boardDTO = boardService.getBoardDetail(boardDTO);
		
		List<BoardDTO> ar = boardService.getBoardResultList(boardDTO);
	    mv.addObject("resultList", ar);

		mv.addObject("dto", boardDTO);
		mv.setViewName("board/detail");
		return mv;
	}

	@GetMapping("add")
	public ModelAndView setBoardAdd(ModelAndView mv) throws Exception{
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		mv.addObject("memberId", memberDTO.getMemberId());
		mv.setViewName("board/add");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setBoardAdd(BoardDTO boardDTO, MultipartFile [] multipartFiles, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = boardService.SetBoardAdd(boardDTO, multipartFiles, session);
		String message = "등록 실패";
		if(result>0) {
			message = "게시물이 등록되었습니다";
		}
		mv.addObject("result", message);
		mv.addObject("url", "./list");
		mv.setViewName("common/result");
		return mv;
	}

	
	@GetMapping("delete")
	public ModelAndView setBoardDelete(BoardDTO boardDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = boardService.setBoardDelete(boardDTO, httpSession);
		String message = "삭제 실패";
		if(result>0) {
			message = "게시물이 삭제되었습니다";
		}
		mv.addObject("result", message);
		mv.addObject("url", "./list");
		mv.setViewName("common/result");
		return mv;
	}
	
	@PostMapping("boardImgDelete")
	public ModelAndView setBoardImgDelete(Integer fileNum) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = boardService.setBoardImgDelete(fileNum);
		mv.addObject("result",result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setBoardUpdate(BoardDTO boardDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		boardDTO = boardService.getBoardDetail(boardDTO);
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/update");
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setBoardUpdate(BoardDTO boardDTO, MultipartFile [] multipartFiles, HttpSession session) throws Exception{
		System.out.println("check");
		ModelAndView mv = new ModelAndView();
		int result = boardService.setBoardUpdate(boardDTO, multipartFiles, session);
		mv.setViewName("common/result");
		mv.addObject("result","수정성공");
		mv.addObject("url","./detail"+"?boardNum="+boardDTO.getBoardNum());
		return mv;
	}
	
	// 로그인 했을때만 가능
	@GetMapping("myList")
	public ModelAndView getBoardMyList(Pager pager) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		pager.setMemberId(memberDTO.getMemberId());
		List<BoardDTO> boardDTOs = boardService.getBoardList(pager);
		modelAndView.addObject("boardDTOs", boardDTOs);
		modelAndView.setViewName("/board/myList");
		
		return modelAndView;
	}
//	@GetMapping("/getTopList")
//	public ModelAndView getBoardTopList(Pager pager)throws Exception{
//		ModelAndView modelAndView = new ModelAndView();
//		List<BoardDTO> boardDTOs = boardService.getBoardTopList();
//		modelAndView.addObject("boardDTOs", boardDTOs);
//		modelAndView.setViewName("/board/topList");
//		return modelAndView;
//	}
	
	
	//-------------------------
	
	// ajax
	@PostMapping("picAdd")
	public ModelAndView setBoardPicAdd(BoardPicDTO boardPicDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = boardService.SetBoardPicAdd(boardPicDTO);
		mv.addObject("result",result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	// ajax
	@PostMapping("picDelete")
	public ModelAndView setBoardPicDelete(BoardPicDTO boardPicDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = boardService.setBoardPicDelete(boardPicDTO);
		mv.addObject("result",result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	// ajax
	@GetMapping("picList")
	public ModelAndView getBoardPicList(BoardPicDTO boardPicDTO)throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		List<BoardDTO> boardDTOs = boardService.getBoardMyPicList(boardPicDTO);
		
		modelAndView.addObject("boardDTOs", boardDTOs);
		modelAndView.setViewName("/board/picList");
		return modelAndView;
	}
	
	@PostMapping("/myBoardPicTotalCount")
	public ModelAndView getMyBoardPicTotalCount() {
		ModelAndView modelAndView = new ModelAndView();
		
		int result = boardService.getMyBoardPicTotalCount();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/common/ajaxResult");
		
		return modelAndView;
	}
}
