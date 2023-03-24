package com.main.branch.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.branch.member.MemberDTO;

@Repository
public class RoomDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.main.branch.chat.RoomDAO.";
	
	public List<MessageDTO> getRoomMessageList(MessageDTO messageDTO){
		return sqlSession.selectList(NAMESPACE + "getRoomMessageList", messageDTO);
	}
	public List<RoomDTO> getMyRoomList(MemberDTO memberDTO){
		return sqlSession.selectList(NAMESPACE + "getMyRoomList", memberDTO);
	}
	public RoomDTO getRoomDetail(RoomDTO roomDTO) {
		return sqlSession.selectOne(NAMESPACE + "getRoomDetail", roomDTO);
	}
	public int setRoomAdd(RoomDTO roomDTO) {
		return sqlSession.insert(NAMESPACE + "setRoomAdd", roomDTO);
	}
	public int setRoomMessageAdd(MessageDTO messageDTO) {
		return sqlSession.insert(NAMESPACE + "setRoomMessageAdd", messageDTO);
	}
	public List<MessageDTO> getRoomParticipantsList(RoomDTO roomDTO){
		return sqlSession.selectList(NAMESPACE + "getRoomParticipantsList", roomDTO);
	}
	public List<RoomDTO> getRoomList(){
		return sqlSession.selectList(NAMESPACE + "getRoomList");
	}
	public RoomDTO setOneToOneChat(MessageDTO messageDTO) {
		return sqlSession.selectOne(NAMESPACE + "setOneToOneChat", messageDTO);
	}
	public MessageDTO checkAlreadyParticipant(MessageDTO messageDTO) {
		return sqlSession.selectOne(NAMESPACE + "checkAlreadyParticipant", messageDTO);
	}
}
