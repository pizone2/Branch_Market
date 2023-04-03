package com.main.branch.notice;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.branch.member.MemberDTO;
import com.main.branch.util.Pager;
import com.main.branch.util.Parser;

@Service
public class NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private HttpSession httpSession;
	
	public List<NoticeDTO> getNoticeList(Pager pager){
		pager.makeNum(noticeDAO.getNoticeCount(pager));
		pager.makeRow();
		List<NoticeDTO> noticeDTOs = noticeDAO.getNoticeList(pager);
		
		for(NoticeDTO noticeDTO : noticeDTOs) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			noticeDTO.setDate(dateFormat.format(noticeDTO.getNoticeDate()));
		}
		
		return noticeDTOs;
	}
	public int setNoticeAdd(NoticeDTO noticeDTO) {
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		noticeDTO.setMemberId(memberDTO.getMemberId());
		
		return noticeDAO.setNoticeAdd(noticeDTO);
	}
	public NoticeDTO getNoticeDetail(NoticeDTO noticeDTO) {
		noticeDAO.setNoticeHitAdd(noticeDTO);
		return noticeDAO.getNoticeDetail(noticeDTO);
	}
	public int setNoticeDelete(NoticeDTO noticeDTO) {
		return noticeDAO.setNoticeDelete(noticeDTO);
	}
	public int setNoticeUpdate(NoticeDTO noticeDTO) {
		return noticeDAO.setNoticeUpdate(noticeDTO);
	}
	public List<NoticeDTO> getNoticeTopList(){
		List<NoticeDTO> noticeDTOs = noticeDAO.getNoticeTopList();
		for(NoticeDTO dto : noticeDTOs) {
			dto.setNoticeContents(Parser.html2text(dto.getNoticeContents()));
			if(dto.getNoticeContents().length() > 40) {
				String contents = dto.getNoticeContents().substring(0, 40);
				contents += "...";
				dto.setNoticeContents(contents);
			}
		}
		return noticeDTOs;
	}
	
}
