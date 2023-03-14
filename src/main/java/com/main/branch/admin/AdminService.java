package com.main.branch.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.branch.member.MemberDTO;
import com.main.branch.util.Pager;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;
	
	public List<MemberDTO> getMemberList(Pager pager){
		pager.setPerPage(5);
		pager.makeNum(adminDAO.getMemberCount(pager));
		pager.makeRow();
		return adminDAO.getMemberList(pager);
	}
	public int setAdminAdd(MemberDTO memberDTO) {
		return adminDAO.setAdminAdd(memberDTO);
	}
}
