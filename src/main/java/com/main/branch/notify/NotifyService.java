package com.main.branch.notify;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.main.branch.member.MemberDTO;
import com.main.branch.product.ProductDTO;
import com.main.branch.util.Pager;

@Service
public class NotifyService {

	@Autowired
	private NotifyDAO notifyDAO;
	
	@Autowired
	private HttpSession httpSession;
	
	public List<NotifyDTO> getNotifyList(Pager pager) throws Exception{
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		pager.setMemberId(memberDTO.getMemberId());
		
		pager.makeNum(notifyDAO.getNotifyCount(pager));
		pager.makeRow();
		
		return notifyDAO.getNotifyList(pager);
	}
	
	public Integer setNotifyAdd(NotifyDTO notifyDTO) throws Exception{
		Integer result;
		
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		notifyDTO.setMemberId(memberDTO.getMemberId());
		
		return notifyDAO.setNotifyAdd(notifyDTO);
	}
	
	public Integer setNotifyDelete(NotifyDTO notifyDTO) throws Exception{
		return notifyDAO.setNotifyDelete(notifyDTO);
	}
	
}
