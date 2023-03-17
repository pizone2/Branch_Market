package com.main.branch.comments;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.main.branch.util.Pager;



@Service
public class CommentsService {

	@Autowired
	private CommentsDAO commentsDAO;
	
	
	
	
	public List<CommentsDTO> getCommentsList(Pager pager) throws Exception {
	//	System.out.println(commentsDAO.getTotalCount());
		pager.makeNum(commentsDAO.getTotalCount(pager));
		pager.makeRow();
		
		return commentsDAO.getCommentsList(pager);		
	}
	
	public int setCommentsUpdate(CommentsDTO commentsDTO) throws Exception {
		return commentsDAO.setCommentsUpdate(commentsDTO);
	}

	
	public int setCommentsAdd(CommentsDTO commentsDTO, HttpSession session) throws Exception {
		return commentsDAO.setCommentsAdd(commentsDTO);
	}

	
	public int setCommentsDelete(CommentsDTO commentsDTO, HttpSession session) throws Exception {
		return commentsDAO.setCommentsDelete(commentsDTO);
	}
	
	
	
}
