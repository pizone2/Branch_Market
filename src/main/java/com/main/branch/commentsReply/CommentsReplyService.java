package com.main.branch.commentsReply;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.main.branch.comments.CommentsDTO;
import com.main.branch.util.Pager;

@Service
public class CommentsReplyService {
	
	@Autowired
	private CommentsReplyDAO commentsReplyDAO;
	
	public List<CommentsReplyDTO> getCommentsReplyList(CommentsReplyDTO commentsReplyDTO) throws Exception {

		return commentsReplyDAO.getCommentsReplyList(commentsReplyDTO);		
	}
	
	public int setCommentsReplyUpdate(CommentsReplyDTO commentsReplyDTO) throws Exception {
		return commentsReplyDAO.setCommentsReplyUpdate(commentsReplyDTO);
	}
	
	public int setCommentsReplyAdd(CommentsReplyDTO commentsReplyDTO, HttpSession session) throws Exception {
		return commentsReplyDAO.setCommentsReplyAdd(commentsReplyDTO);
	}
	
	public int setCommentsReplyDelete(CommentsReplyDTO commentsReplyDTO, HttpSession session) throws Exception {
		return commentsReplyDAO.setCommentsReplyDelete(commentsReplyDTO);
	}
	
	
}
