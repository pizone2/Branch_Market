package com.main.branch.event;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.main.branch.event.EventDAO.";
	
	public List<EventDTO> getEventList() {
		return sqlSession.selectList(NAMESPACE + "getEventList");
	}
	public int setEventAdd(EventDTO eventDTO) {
		return sqlSession.insert(NAMESPACE + "setEventAdd",eventDTO);
	}
	public int setEventDelete(EventDTO eventDTO) {
		return sqlSession.update(NAMESPACE + "setEventDelete", eventDTO);
	}
	public int setEventUpdate(EventDTO eventDTO) {
		return sqlSession.update(NAMESPACE + "setEventUpdate",eventDTO);
	}
}
