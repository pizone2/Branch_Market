package com.main.branch.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.branch.util.Pager;

@Service
public class NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;
	
	public List<NoticeDTO> getNoticeList(Pager pager){
		pager.makeNum(noticeDAO.getNoticeCount(pager));
		pager.makeRow();
		
		return noticeDAO.getNoticeList(pager);
	}
}
