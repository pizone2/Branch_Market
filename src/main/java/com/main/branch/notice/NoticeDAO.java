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
	public Integer getNoticeCount(Pager pager) {
		return sqlSession.selectOne(NAMESPAECE + "getNoticeCount", pager);
	}
}
