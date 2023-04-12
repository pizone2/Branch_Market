package com.main.branch.commentsReply;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.comments.CommentsDTO;
import com.main.branch.member.MemberDTO;
import com.main.branch.util.Pager;


@Controller
@RequestMapping("/commentsReply/*")
public class CommentsReplyController {
	
	@Autowired
	private CommentsReplyService commentsReplyService;
	
	//List
		
		@GetMapping("list")
		public ModelAndView getCommentsReplyList (CommentsReplyDTO commentsReplyDTO)throws Exception{
			ModelAndView mv = new ModelAndView();
			
			List<CommentsReplyDTO> ar = commentsReplyService.getCommentsReplyList(commentsReplyDTO);
		
			mv.addObject("list", ar);
			mv.setViewName("commentsReply/list");
		
			return mv;
		}
	//Add
		@PostMapping("add")
		public ModelAndView setCommentsReplyAdd(CommentsReplyDTO commentsReplyDTO,HttpSession session)throws Exception{
			ModelAndView mv = new ModelAndView();
			
			// 나중에 주석해제
			MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
			commentsReplyDTO.setMemberId(memberDTO.getMemberId());
//			commentsReplyDTO.setMemberId("사람");
			int result = commentsReplyService.setCommentsReplyAdd(commentsReplyDTO, session);
			
			mv.addObject("result", result);
			mv.setViewName("common/ajaxResult");	
			return mv;
		}	
	//Delete
		@PostMapping("delete")
		public ModelAndView setCommentsReplyDelete(CommentsReplyDTO commentsReplyDTO)throws Exception{
			ModelAndView mv = new ModelAndView();
			
			int result =commentsReplyService.setCommentsReplyDelete(commentsReplyDTO, null);
			
			mv.addObject("result", result);
			mv.setViewName("common/ajaxResult");
			
			return mv;
		}
	//Update
		@PostMapping("update")
		public ModelAndView setCommentsReplyUpdate(CommentsReplyDTO commentsReplyDTO)throws Exception{
			ModelAndView mv = new ModelAndView();
			
			int result = commentsReplyService.setCommentsReplyUpdate(commentsReplyDTO);
			
			mv.addObject("result", result);
			mv.setViewName("common/ajaxResult");
			
			return mv;
		}
		
		
	
	

	

	
	
	
	
	
	
	
}
