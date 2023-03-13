package com.main.branch.comments;

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
@RequestMapping("Comment/*")
public class CommentsController {
	
	@Autowired
	private CommentsService commentsService;
	
//Listtest
	@GetMapping("test")
	public void getCommentsList()throws Exception{
		
	}
	
//List
	@GetMapping("list")
	public ModelAndView getCommentsList (Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<CommentsDTO> ar = commentsService.getCommentsList(pager);
		
		mv.addObject("list", ar);
		mv.setViewName("comments/list");
	
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
