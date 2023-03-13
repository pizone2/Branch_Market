package com.main.branch.comments;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.util.Pager;


@Controller
@RequestMapping("/comments/*")
public class CommentsController {
	
	@Autowired
	private CommentsService commentsService;
	

	
//List
	@GetMapping("list")
	public ModelAndView getCommentsList (Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<CommentsDTO> ar = commentsService.getCommentsList(pager);
		
//		//////////////// TEST /////////////////////
//		List<CommentsDTO> ar = new ArrayList<CommentsDTO>();
//		CommentsDTO dto1 = new CommentsDTO();
//		dto1.setBoardNum(1);
//		dto1.setCommentNum(1);
//		dto1.setCommentContents("댓글1");
//		ar.add(dto1);
//		CommentsDTO dto2 = new CommentsDTO();
//		dto2.setBoardNum(1);
//		dto2.setCommentNum(2);
//		dto2.setCommentContents("댓글2");
//		ar.add(dto2);
//		///////////////////////////////////////////
		
		mv.addObject("list", ar);
		mv.setViewName("comments/comments");
	
		return mv;
	}
//Add
	@PostMapping("add")
	public ModelAndView setCommentsAdd(CommentsDTO commentsDTO,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = commentsService.setCommentsAdd(commentsDTO, null, session);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");	
		return mv;
	}	
//Delete
	@PostMapping("delete")
	public ModelAndView setCommentsDelete(CommentsDTO commentsDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result =commentsService.setCommentsDelete(commentsDTO, null);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
//Update
	@PostMapping("update")
	public ModelAndView setCommentsUpdate(CommentsDTO commentsDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = commentsService.setCommentsUpdate(commentsDTO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
