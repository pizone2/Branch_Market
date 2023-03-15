package com.main.branch.inquiry;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.branch.member.MemberDTO;
import com.main.branch.util.Pager;

@Service
public class InquiryService {
	@Autowired
	private InquiryDAO inquiryDAO;
	@Autowired
	private HttpSession httpSession;
	
	public List<InquiryDTO> getInquiryList(Pager pager){
		pager.makeNum(inquiryDAO.getInquiryCount(pager));
		pager.makeRow();
		return inquiryDAO.getInquiryList(pager);
	}
	public int setInquriyUpdate(InquiryDTO inquiryDTO) {
		return inquiryDAO.setInquriyUpdate(inquiryDTO);
	}
	public int setInquriyAdd(InquiryDTO inquiryDTO) {
		return inquiryDAO.setInquriyAdd(inquiryDTO);
	}
	public InquiryDTO getInquriyDetail(InquiryDTO inquiryDTO) {
		return inquiryDAO.getInquriyDetail(inquiryDTO);
	}
	public int setInquiryDelete(InquiryDTO inquiryDTO) {
		return inquiryDAO.setInquiryDelete(inquiryDTO);
	}
}
