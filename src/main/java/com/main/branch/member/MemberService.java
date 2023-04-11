package com.main.branch.member;

import java.util.List;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private JavaMailSender jmsender;
	
	
	public int getMemberFindPw(MemberDTO memberDTO) throws Exception {
		MemberDTO memberDTO2 = memberDAO.getMemberDetail(memberDTO);
		if(memberDTO2 != null &&memberDTO.getMemberEmail().equals(memberDTO2.getMemberEmail())) {
			memberDTO.setMemberPw(memberDTO2.getMemberPw());
			String newPw = UUID.randomUUID().toString().substring(0, 7);
			memberDTO.setChangeMemberPw(newPw);

			int result = memberDAO.setMemberUpdatePw(memberDTO);
			if(result > 0) {
				
				MimeMessage message = jmsender.createMimeMessage();
				
				message.setSubject("[가지마켓 안내] 비밀번호 알려드립니다.");
				String htmlStr = "<div style=\"background-image: url('https://png.pngtree.com/thumb_back/fw800/background/20220309/pngtree-blue-sky-and-white-clouds-meadow-cherry-blossom-spring-flowers-image_1067065.jpg');height: 300px;width: 300px;border-radius: 70px;border: 1px black solid;\">\r\n"
						+ "        <h2 style=\"text-align: center;\">Branch Market</h2>\r\n"
						+ "        <h4>안녕하세요 가지마켓 입니다 임시 비밀번호는 " + newPw +" 입니다.</h4>\r\n"
						+ "     </div>";
				message.setText(htmlStr,"UTF-8","html");
				message.addRecipient(RecipientType.TO, new InternetAddress(memberDTO.getMemberEmail()));
				jmsender.send(message);
				
				return 1;
			}else {
				return 0;
			}
		}else {
			return 0;
		}
		
	}
	
	public int getMemberFindId(MemberDTO memberDTO) throws Exception {
		String memberId = memberDAO.getMemberFindId(memberDTO);
		if(memberId != null) {
			
			MimeMessage message = jmsender.createMimeMessage();
			
			message.setSubject("[가지마켓 안내] 아이디 알려드립니다.");
			String htmlStr = "<div style=\"background-image: url('https://png.pngtree.com/thumb_back/fw800/background/20220309/pngtree-blue-sky-and-white-clouds-meadow-cherry-blossom-spring-flowers-image_1067065.jpg');height: 300px;width: 300px;border-radius: 70px;border: 1px black solid;\">\r\n"
					+ "        <h2 style=\"text-align: center;\">Branch Market</h2>\r\n"
					+ "        <h4>안녕하세요 가지마켓 입니다 요청하신 아이디는 " + memberId +" 입니다.</h4>\r\n"
					+ "     </div>";
			message.setText(htmlStr,"UTF-8","html");
			message.addRecipient(RecipientType.TO, new InternetAddress(memberDTO.getMemberEmail()));
			jmsender.send(message);
			
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
			memberDTO = memberDTO2;
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
	public int setMemberDelete() {
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		return memberDAO.setMemberDelete(memberDTO);
	}
	public int setMemberHitUpdate(MemberDTO memberDTO) {
		return memberDAO.setMemberHitUpdate(memberDTO);
	}
}
