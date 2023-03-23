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
            	insertDTO.setIsRead(0);
            }else {
            	insertDTO.setIsRead(1);
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
	public int setRoomAdd(String[] participants, RoomDTO roomDTO) {
		// 방 만들기
		int result = roomDAO.setRoomAdd(roomDTO);
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		
		// --------- 참가자 전용 확인은 isRead가 -2 또는 -1임
		
		MessageDTO messageDTO = new MessageDTO();
		messageDTO.setRoomNum(roomDTO.getRoomNum());
		messageDTO.setContents("");
		messageDTO.setReceiveId("");
		
		// 1:1 채팅방일때 read -2
		if(participants.length == 1) {
			messageDTO.setIsRead(-2);
			
			messageDTO.setSendId(memberDTO.getMemberId());
			result = roomDAO.setRoomMessageAdd(messageDTO);
			
			// 보내는 사람 설정
			messageDTO.setSendId(participants[0]);
			// 받는 사람 설정 
			result = roomDAO.setRoomMessageAdd(messageDTO);
		}
		// 1:n 채팅방일때 read -1
		else {
			messageDTO.setIsRead(-1);
			messageDTO.setSendId(memberDTO.getMemberId());
			result = roomDAO.setRoomMessageAdd(messageDTO);
			
			for(String participant : participants) {
				// 보내는 사람 설정
				messageDTO.setSendId(participant);
				result = roomDAO.setRoomMessageAdd(messageDTO);
			}
		}	
		return result;
	}
}
