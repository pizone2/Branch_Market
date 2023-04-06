package com.main.branch.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.branch.member.MemberDTO;
import com.main.branch.util.Pager;

@Repository
public class RoomDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.main.branch.chat.RoomDAO.";
	
	public List<MessageDTO> getRoomMessageList(MessageDTO messageDTO){
		return sqlSession.selectList(NAMESPACE + "getRoomMessageList", messageDTO);
	}
	public List<RoomDTO> getMyRoomList(Pager pager){
		return sqlSession.selectList(NAMESPACE + "getMyRoomList", pager);
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
	public List<RoomDTO> getRoomList(Pager pager){
		return sqlSession.selectList(NAMESPACE + "getRoomList",pager);
	}
	public RoomDTO setOneToOneChat(MessageDTO messageDTO) {
		return sqlSession.selectOne(NAMESPACE + "setOneToOneChat", messageDTO);
	}
	public MessageDTO checkAlreadyParticipant(MessageDTO messageDTO) {
		return sqlSession.selectOne(NAMESPACE + "checkAlreadyParticipant", messageDTO);
	}
	public int delRecordMessage(MessageDTO messageDTO) {
		return sqlSession.delete(NAMESPACE + "delRecordMessage", messageDTO);
	}
	public int setQuitRoom(MessageDTO messageDTO) {
		return sqlSession.delete(NAMESPACE + "setQuitRoom", messageDTO);
	}
	public MessageDTO checkRoomMember(MessageDTO messageDTO) {
		return sqlSession.selectOne(NAMESPACE + "checkRoomMember", messageDTO);
	}
	public MessageDTO checkOneToOneChat(MessageDTO messageDTO) {
		return sqlSession.selectOne(NAMESPACE + "checkOneToOneChat", messageDTO);
	}
	public MessageDTO checkParticipantOneChat(MessageDTO messageDTO) {
		return sqlSession.selectOne(NAMESPACE + "checkParticipantOneChat", messageDTO);
	}
	public int getUnreadMessageCnt(MessageDTO messageDTO) {
		return sqlSession.selectOne(NAMESPACE + "getUnreadMessageCnt", messageDTO);
	}
	public int updateMemberRead(MessageDTO messageDTO) {
		return sqlSession.update(NAMESPACE + "updateMemberRead", messageDTO);
	}
	public int getTotalUnreadMessageCnt(MessageDTO messageDTO) {
		return sqlSession.selectOne(NAMESPACE + "getTotalUnreadMessageCnt", messageDTO);
	}
}
