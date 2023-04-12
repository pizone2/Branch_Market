package com.main.branch.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.main.branch.InqComments.InqCommentsDAO;
import com.main.branch.InqComments.InqCommentsDTO;
import com.main.branch.board.BoardDAO;
import com.main.branch.board.BoardDTO;
import com.main.branch.comments.CommentsDAO;
import com.main.branch.comments.CommentsDTO;
import com.main.branch.commentsReply.CommentsReplyDAO;
import com.main.branch.commentsReply.CommentsReplyDTO;
import com.main.branch.inquiry.InquiryDAO;
import com.main.branch.inquiry.InquiryDTO;
import com.main.branch.member.MemberDTO;
import com.main.branch.product.ProductDAO;
import com.main.branch.product.ProductDTO;
import com.main.branch.review.ReviewDAO;
import com.main.branch.review.ReviewDTO;

@Component
public class WriterCheckInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private InqCommentsDAO inqCommentsDAO;
	@Autowired
	private InquiryDAO inquiryDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private CommentsReplyDAO commentsReplyDAO;
	@Autowired
	private CommentsDAO commentsDAO;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		String[] paths = request.getRequestURI().split("/");
		
		if(paths.length >= 2) {
			
			String path = paths[1];
			
			if(path.equals("board")) {
				int boardNum =  Integer.parseInt(request.getParameter("boardNum"));
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setBoardNum(boardNum);
				boardDTO = boardDAO.getBoardDetail(boardDTO);

				if(boardDTO.getMemberId().equals(memberDTO.getMemberId())){
					return true;
				}else {
					RequestDispatcher view = request.getRequestDispatcher("/oops");
					view.forward(request, response);
					return false;
				}
			}else if(path.equals("inqComments")) {
				int inqCommentsNum = Integer.parseInt(request.getParameter("inqCommentsNum"));
				InqCommentsDTO inqCommentsDTO = new InqCommentsDTO();
				inqCommentsDTO.setInqCommentsNum(inqCommentsNum);
				inqCommentsDTO = inqCommentsDAO.getInqCommentsDetail(inqCommentsDTO);

				if(inqCommentsDTO.getMemberId().equals(memberDTO.getMemberId())) {
					return true;
				}else {
					RequestDispatcher view = request.getRequestDispatcher("/oops");
					view.forward(request, response);
					return false;
				}
			}else if(path.equals("inquiry")) {
				int inquiryNum = Integer.parseInt(request.getParameter("inquiryNum"));
				InquiryDTO inquiryDTO = new InquiryDTO();
				inquiryDTO.setInquiryNum(inquiryNum);
				inquiryDTO = inquiryDAO.getInquriyDetail(inquiryDTO);

				if(inquiryDTO.getMemberId().equals(memberDTO.getMemberId())) {
					
					return true;
				}else {
					RequestDispatcher view = request.getRequestDispatcher("/oops");
					view.forward(request, response);
					
					return false;
				}
			}else if(path.equals("product")) {
				int productNum = Integer.parseInt(request.getParameter("productNum"));
				ProductDTO productDTO = new ProductDTO();
				productDTO.setProductNum(productNum);
				productDTO = productDAO.getProductDetail(productDTO);
				
				if(memberDTO.getMemberRole().equals("admin")) {
					return true;
				}else {
					RequestDispatcher view = request.getRequestDispatcher("/oops");
					view.forward(request, response);
					return false;
				}
			}else if(path.equals("review")) {

				int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
				ReviewDTO reviewDTO = new ReviewDTO();
				reviewDTO.setReviewNum(reviewNum);
				reviewDTO = reviewDAO.getReviewDetail(reviewDTO);

				if(reviewDTO.getMemberId().equals(memberDTO.getMemberId())) {
					return true;
				}else {
					RequestDispatcher view = request.getRequestDispatcher("/oops");
					view.forward(request, response);
					
					return false;
				}
			}else if(path.equals("commentsReply")) {
				Long replyNum = Long.parseLong(request.getParameter("replyNum"));
				CommentsReplyDTO commentsReplyDTO = new CommentsReplyDTO();
				commentsReplyDTO.setReplyNum(replyNum);
				commentsReplyDTO = commentsReplyDAO.getCommentsDetail(commentsReplyDTO);
				
				if(commentsReplyDTO.getMemberId().equals(memberDTO.getMemberId())) {
					return true;
				}else {
					RequestDispatcher view = request.getRequestDispatcher("/oops");
					view.forward(request, response);
					
					return false;
				}
			}else if(path.equals("comments")) {
				int commentsNum = Integer.parseInt(request.getParameter("commentsNum"));
				CommentsDTO commentsDTO = new CommentsDTO();
				commentsDTO.setCommentsNum(commentsNum);
				commentsDTO = commentsDAO.getCommentsDetail(commentsDTO);
				
				if(commentsDTO.getMemberId().equals(memberDTO.getMemberId())) {
					return true;
				}else {
					RequestDispatcher view = request.getRequestDispatcher("/oops");
					view.forward(request, response);
					
					return false;
				}
			}
		}
		
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	
	
}
