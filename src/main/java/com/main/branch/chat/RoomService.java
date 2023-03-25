package com.main.branch.chat;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.branch.member.MemberDTO;

@Service
public class RoomService {
	@Autowired
	private RoomDAO roomDAO;
	@Autowired
	private HttpSession httpSession;
	
	public int setRoomMessageAdd(MessageDTO messageDTO) {
		// messageDTO는 roomNum, contents 담겨져 있음
		Integer roomNum = messageDTO.getRoomNum();
		String contents = messageDTO.getContents();
		
    	// 이 방에 참가한 사람들 리스트를 messageDTOs에 담음
    	RoomDTO roomDTO = new RoomDTO();
    	roomDTO.setRoomNum(messageDTO.getRoomNum());
    	List<MessageDTO> messageDTOs = roomDAO.getRoomParticipantsList(roomDTO);
    	
    	// sendId 설정
    	MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
    	String sender = memberDTO.getMemberId();
    	
    	int result = 0;
    	for(MessageDTO dto : messageDTOs) {
    		// 참가한 사람한테 메세지를 DB에 저장
            MessageDTO insertDTO = new MessageDTO();
            insertDTO.setRoomNum(roomNum);
            insertDTO.setSendId(sender);
            insertDTO.setReceiveId(dto.getSendId());
            insertDTO.setContents(contents);
            if(sender.equals(dto.getSendId())) {
            	insertDTO.setIsRead(1);
            }else {
            	insertDTO.setIsRead(0);
            }
            result = roomDAO.setRoomMessageAdd(insertDTO);
    	}
    	return result;
	}
	public List<MessageDTO> getRoomMessageList(MessageDTO messageDTO){
		return roomDAO.getRoomMessageList(messageDTO);
	}
	public List<RoomDTO> getMyRoomList(MemberDTO memberDTO){
		// 내가 들어간 채팅 리스트의 pk를 가져옴
		List<RoomDTO> roomDTOs = roomDAO.getMyRoomList(memberDTO); 
		// pk가지고 조회해서 가져옴
		for(int i = 0; i< roomDTOs.size();i++) {
			roomDTOs.set(i, roomDAO.getRoomDetail(roomDTOs.get(i)));
		}
		return roomDTOs; 
	}
	
	// 제목만 있음
	public int setRoomAdd(String[] participants, RoomDTO roomDTO) {
		// 방 만들기
		int result = roomDAO.setRoomAdd(roomDTO);
		// --------- 참가자 전용 확인은 isRead가 -2 또는 -1임
		
		MessageDTO messageDTO = new MessageDTO();
		messageDTO.setRoomNum(roomDTO.getRoomNum());
		messageDTO.setContents("");
		messageDTO.setReceiveId("");
		
		// 1:1 채팅방일때 read -2
		if(participants.length == 2) {
			
			messageDTO.setIsRead(-2);
			// 참가자 목록 조회용
			messageDTO.setSendId(participants[0]);
			result = roomDAO.setRoomMessageAdd(messageDTO);
			// 참가자 목록 조회용
			messageDTO.setSendId(participants[1]);
			result = roomDAO.setRoomMessageAdd(messageDTO);
			
			// 1 : 1 채팅방 존재 한번에 찾기 용
			messageDTO.setIsRead(-3);
			messageDTO.setSendId(participants[0]);
			messageDTO.setReceiveId(participants[1]);
			result = roomDAO.setRoomMessageAdd(messageDTO);
		}
		// 1:n 채팅방일때 read -1
		else {
			messageDTO.setIsRead(-1);

			for(String participant : participants) {
				if(participant == null || participant == "")continue;
				// 보내는 사람 설정
				messageDTO.setSendId(participant);
				result = roomDAO.setRoomMessageAdd(messageDTO);
			}
		}	
		return result;
	}
	public List<RoomDTO> getRoomList(){
		return roomDAO.getRoomList();
	}
	public RoomDTO setOneToOneChat(MessageDTO messageDTO) {

		RoomDTO roomDTO = roomDAO.setOneToOneChat(messageDTO);
		// 이전에 업던 방이면
		if(roomDTO == null) {
			String [] participants = new String[2];
			participants[0] = messageDTO.getReceiveId();
			participants[1] = messageDTO.getSendId();
			// 방제 임의 설정
			roomDTO = new RoomDTO();
			roomDTO.setRoomTitle(participants[0] + " : " + participants[1]);
			// 방 만들기
			this.setRoomAdd(participants, roomDTO);
		}
		
		return roomDTO;
	}

	// 초대하기 1 : n 일때만가능
	public int setMemberInviteRoom(Integer roomNum, String memberId) {
		MessageDTO messageDTO = new MessageDTO();
		messageDTO.setRoomNum(roomNum);
		messageDTO.setSendId(memberId);
		messageDTO.setContents("");
		messageDTO.setIsRead(-1);
		messageDTO.setReceiveId("");
		return roomDAO.setRoomMessageAdd(messageDTO);
	}
	
	// reciveId roomNum 있어야함
	public int delRecordMessage(MessageDTO messageDTO) {
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		messageDTO.setReceiveId(memberDTO.getMemberId());
		
		return roomDAO.delRecordMessage(messageDTO);
	}
	public int setQuitRoom(MessageDTO messageDTO) {
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		messageDTO.setReceiveId(memberDTO.getMemberId());
		messageDTO.setSendId(memberDTO.getMemberId());
		
		roomDAO.delRecordMessage(messageDTO);
		return roomDAO.setQuitRoom(messageDTO);
	}
}
