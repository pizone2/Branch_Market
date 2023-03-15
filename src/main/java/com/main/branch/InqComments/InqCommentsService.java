package com.main.branch.InqComments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InqCommentsService {
	@Autowired
	private InqCommentsDAO inqCommentsDAO;
	
	public List<InqCommentsDTO> getInqCommentsList(InqCommentsDTO inqCommentsDTO){
		return inqCommentsDAO.getInqCommentsList(inqCommentsDTO);
	}
}
