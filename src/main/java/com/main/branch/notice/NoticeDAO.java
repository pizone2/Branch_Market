package com.main.branch.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.branch.util.Pager;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPAECE = "com.main.branch.notice.NoticeDAO.";
	
	public List<NoticeDTO> getNoticeList(Pager pager){
		return sqlSession.selectList(NAMESPAECE + "getNoticeList", pager);
	}
	public int getNoticeCount(Pager pager) {
		return sqlSession.selectOne(NAMESPAECE + "getNoticeCount", pager);
	}
	public int setNoticeAdd(NoticeDTO noticeDTO) {
		return sqlSession.insert(NAMESPAECE + "setNoticeAdd", noticeDTO);
	}
	public NoticeDTO getNoticeDetail(NoticeDTO noticeDTO) {
		return sqlSession.selectOne(NAMESPAECE + "getNoticeDetail", noticeDTO);
	}
	public int setNoticeDelete(NoticeDTO noticeDTO) {
		return sqlSession.delete(NAMESPAECE + "setNoticeDelete", noticeDTO);
	}
	public int setNoticeUpdate(NoticeDTO noticeDTO) {
		return sqlSession.update(NAMESPAECE + "setNoticeUpdate", noticeDTO);
	}
	public int setNoticeHitAdd(NoticeDTO noticeDTO) {
		return sqlSession.update(NAMESPAECE + "setNoticeHitAdd", noticeDTO);
	}
	public NoticeDTO getNoticeDetailRowNum(NoticeDTO noticeDTO) {
		return sqlSession.selectOne(NAMESPAECE + "getNoticeDetailRowNum", noticeDTO);
	}
	public List<NoticeDTO> getNoticeTopList(){
		return sqlSession.selectList(NAMESPAECE + "getNoticeTopList");
	}
}
