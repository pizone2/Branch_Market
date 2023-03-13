package com.main.branch.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.util.Pager;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
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
		boardDTO = boardService.getBoardDetail(boardDTO);
		mv.addObject("detail", boardDTO);
		mv.setViewName("board/detail");
		return mv;
	}

	@GetMapping("add")
	public ModelAndView setBoardAdd(ModelAndView mv) throws Exception{
		mv.setViewName("board/add");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setBoardAdd(BoardDTO boardDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = boardService.SetBoardAdd(boardDTO);
		String message = "등록 실패";
		if(result>0) {
			message = "게시물이 등록되었습니다";
		}
		mv.addObject("result", message);
		mv.addObject("url", "./list");
		mv.setViewName("common/result");
		return mv;
	}
}
