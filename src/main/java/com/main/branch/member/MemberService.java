package com.main.branch.member;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private MailSender mailSender;
	
	public int getMemberFindPw(MemberDTO memberDTO) {
		
		MemberDTO memberDTO2 = memberDAO.getMemberDetail(memberDTO);
		if(memberDTO2 != null &&memberDTO.getMemberEmail().equals(memberDTO2.getMemberEmail())) {
			memberDTO.setMemberPw(memberDTO2.getMemberPw());
			String newPw = UUID.randomUUID().toString().substring(0, 7);
			memberDTO.setChangeMemberPw(newPw);
		//	System.out.println(newPw);
			
			int result = memberDAO.setMemberUpdatePw(memberDTO);
			if(result > 0) {
				
				SimpleMailMessage smm = new SimpleMailMessage();
				smm.setFrom("computer8857@gmail.com");
				smm.setTo(memberDTO.getMemberEmail());
				smm.setSubject("안녕하세요 가지마켓 입니다 임시 비밀번호 알려드립니다");
				smm.setText("당신의 임시 비밀번호는 " + newPw + " 입니다. -이주형 보냄-");
				mailSender.send(smm);
				
				return 1;
			}else {
				return 0;
			}
		}else {
			return 0;
		}
		
	}
	
	public int getMemberFindId(MemberDTO memberDTO) {
		String memberId = memberDAO.getMemberFindId(memberDTO);
		if(memberId != null) {
			
			SimpleMailMessage smm = new SimpleMailMessage();
			smm.setFrom("computer8857@gmail.com");
			smm.setTo(memberDTO.getMemberEmail());
			smm.setSubject("안녕하세요 가지마켓 입니다 아이디 알려드립니다");
			smm.setText("당신의 아이디는 " + memberId + " 입니다. -이주형 보냄-");
			mailSender.send(smm);
			
			return 1;
		}else {
			return 0;
		}
	}
	
	public int setMemberUpdatePw(MemberDTO memberDTO) {
		return memberDAO.setMemberUpdatePw(memberDTO);
	}
	
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
