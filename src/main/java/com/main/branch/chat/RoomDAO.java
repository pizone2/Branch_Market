package com.main.branch.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoomDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.main.branch.chat.RoomDAO.";
	
	public List<MessageDTO> getRoomMessageList(RoomDTO roomDTO){
		return sqlSession.selectList(NAMESPACE + "getRoomMessageList", roomDTO);
	}
	
}
