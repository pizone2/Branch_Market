package com.main.branch.InqComments;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.branch.member.MemberDTO;
import com.main.branch.util.Pager;

@Service
public class InqCommentsService {
	@Autowired
	private InqCommentsDAO inqCommentsDAO;
	@Autowired
	private HttpSession httpSession;
	
	public List<InqCommentsDTO> getInqCommentsList(Pager pager){
		pager.setPerPage(5);
		pager.makeNum(inqCommentsDAO.getInqCommentsCount(pager));
		pager.makeRow();
		
		return inqCommentsDAO.getInqCommentsList(pager);
	}
	public int setInqCommentsAdd(InqCommentsDTO inqCommentsDTO) {
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		inqCommentsDTO.setMemberId(memberDTO.getMemberId());
		
		return inqCommentsDAO.setInqCommentsAdd(inqCommentsDTO);
	}
	public int setInqCommentsUpdate(InqCommentsDTO inqCommentsDTO) {
		return inqCommentsDAO.setInqCommentsUpdate(inqCommentsDTO);
	}
	public int setInqCommentsDelete(InqCommentsDTO inqCommentsDTO) {
		return inqCommentsDAO.setInqCommentsDelete(inqCommentsDTO);
	}
}
