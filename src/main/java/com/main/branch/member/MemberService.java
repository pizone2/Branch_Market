package com.main.branch.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private HttpSession httpSession;
	
	public List<MemberDTO> getMemberList(){
		return memberDAO.getMemberList();
	}
	public int setMemberAdd(MemberDTO memberDTO) {
		return memberDAO.setMemberAdd(memberDTO);
	}
	public MemberDTO getMemberDetail(MemberDTO memberDTO) {
		return memberDAO.getMemberDetail(memberDTO);
	}
	public MemberDTO setMemberLogin(MemberDTO memberDTO) {
		MemberDTO memberDTO2 = memberDAO.getMemberDetail(memberDTO);
		if(memberDTO2!= null && memberDTO2.getMemberPw().equals(memberDTO.getMemberPw())) {
			return memberDTO;
		}else {
			return null;
		}
	}
	public int setMemberUpdate(MemberDTO memberDTO) {
		return memberDAO.setMemberUpdate(memberDTO);
	}
	public boolean checkMemberIdPw(MemberDTO memberDTO) {
		MemberDTO memberDTO2 = (MemberDTO) httpSession.getAttribute("member");
		if(memberDTO2.getMemberId().equals(memberDTO.getMemberId()) && memberDTO2.getMemberPw().equals(memberDTO.getMemberPw())) {
			return true;
		}else {
			return false;
		}
	}
	public int setMemberDelete(MemberDTO memberDTO) {
		return memberDAO.setMemberDelete(memberDTO);
	}
}
