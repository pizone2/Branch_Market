package com.main.branch.comments;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.main.branch.board.BoardDAO;
import com.main.branch.board.BoardDTO;
import com.main.branch.notify.NotifyDAO;
import com.main.branch.notify.NotifyDTO;
import com.main.branch.product.ProductDTO;
import com.main.branch.util.Pager;



@Service
public class CommentsService {

	@Autowired
	private CommentsDAO commentsDAO;
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Autowired
	private NotifyDAO notifyDAO;
	
	
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
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setBoardNum(commentsDTO.getBoardNum());
		
		boardDTO = boardDAO.getBoardDetail(boardDTO);
		
		NotifyDTO notifyDTO = new NotifyDTO();
		notifyDTO.setMemberId(boardDTO.getMemberId());
		
		notifyDTO.setNotifyMessage(boardDTO.getBoardTitle() + " 게시글의 댓글이 등록되었습니다");
		notifyDAO.setNotifyAdd(notifyDTO);
		
		return commentsDAO.setCommentsAdd(commentsDTO);
	}

	
	public int setCommentsDelete(CommentsDTO commentsDTO, HttpSession session) throws Exception {
		return commentsDAO.setCommentsDelete(commentsDTO);
	}
	
	
	
}
