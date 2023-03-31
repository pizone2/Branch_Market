package com.main.branch.notify;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.branch.util.Pager;

@Repository
public class NotifyDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.main.branch.notify.NotifyDAO.";
	
	public Integer getNotifyCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getNotifyCount", pager);
	}
	
	public List<NotifyDTO> getNotifyList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE + "getNotifyList", pager);
	}
	
	public Integer setNotifyAdd(NotifyDTO notifyDTO) throws Exception{
		return sqlSession.insert(NAMESPACE + "setNotifyAdd", notifyDTO);
	}
	
	public Integer setNotifyDelete(NotifyDTO notifyDTO) throws Exception{
		return sqlSession.delete(NAMESPACE + "setNotifyDelete", notifyDTO);
	}
	
}
