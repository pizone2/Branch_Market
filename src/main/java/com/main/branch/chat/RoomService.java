package com.main.branch.chat;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.member.MemberDTO;
import com.main.branch.util.Pager;
import com.main.branch.util.Parser;

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
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		messageDTO.setReceiveId(memberDTO.getMemberId());
		
		return roomDAO.getRoomMessageList(messageDTO);
	}
	public List<RoomDTO> getMyRoomList(Pager pager){
		// 내가 들어간 채팅 리스트의 pk를 가져옴
		List<RoomDTO> roomDTOs = roomDAO.getMyRoomList(pager); 
		
		// 최근 메세지 세팅
		for(RoomDTO roomDTO : roomDTOs) {
			MessageDTO messageDTO = new MessageDTO();
			messageDTO.setRoomNum(roomDTO.getRoomNum());
			List<MessageDTO> messageDTOs = getRoomMessageList(messageDTO);
			
			if(messageDTOs.size() > 0) {
				roomDTO.setContents(Parser.longStringToShort(messageDTOs.get(messageDTOs.size() - 1).getContents()));
			}
		}
		// pk가지고 조회해서 가져옴
//		for(int i = 0; i< roomDTOs.size();i++) {
//			roomDTOs.set(i, roomDAO.getRoomDetail(roomDTOs.get(i)));
//		}
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
	public List<RoomDTO> getRoomList(Pager pager){
		return roomDAO.getRoomList(pager);
	}
	public RoomDTO setOneToOneChat(MessageDTO messageDTO) {
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		
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
		// 방은 위에서 만들거나 있는 상태고 참가 상태확인
		setMemberInviteRoom(roomDTO.getRoomNum(), memberDTO.getMemberId(), -2);
		return roomDTO;
	}

	// isReady -2 or -1 목록만 추가
	public int setMemberInviteRoom(Integer roomNum, String memberId,Integer isReady) {
		
		// 방은 있지만 보이는 목록에 없는 상태확인
		MessageDTO messageDTO = new MessageDTO();
		messageDTO.setRoomNum(roomNum);
		messageDTO.setSendId(memberId);
		messageDTO.setIsRead(isReady);
		messageDTO = roomDAO.checkRoomMember(messageDTO);
		// 방은 있는데 목록만 없으면 목록추가
		if(messageDTO == null) {
			messageDTO = new MessageDTO();
			messageDTO.setRoomNum(roomNum);
			messageDTO.setSendId(memberId);
			messageDTO.setContents("");
			messageDTO.setIsRead(isReady);
			messageDTO.setReceiveId("");
			return roomDAO.setRoomMessageAdd(messageDTO);
		}else {
			return 1;
		}
		
		
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
	public int checkOneToOneChat(Integer roomNum) {
		ModelAndView modelAndView = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		MessageDTO messageDTO = new MessageDTO();
		
		messageDTO.setRoomNum(roomNum);
		messageDTO = roomDAO.checkOneToOneChat(messageDTO);
		if(messageDTO != null) {
			messageDTO.setSendId(memberDTO.getMemberId());
			messageDTO.setRoomNum(roomNum);
			messageDTO = roomDAO.checkParticipantOneChat(messageDTO);
			if(messageDTO == null) {
				System.out.println("1:1 채팅은 참가자만 접근가능");
				return 0;
			}
		}
		return 1;
	}
	public int updateMemberRead(Integer roomNum) {
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		
		MessageDTO messageDTO = new MessageDTO();
		messageDTO.setReceiveId(memberDTO.getMemberId());
		messageDTO.setRoomNum(roomNum);
		return roomDAO.updateMemberRead(messageDTO);
	}
	public void setUnreadMessageCnt(List<RoomDTO> roomDTOs) {
		MemberDTO memberDTO =(MemberDTO) httpSession.getAttribute("member");
		
		// 방 별로 읽지읺는 메세지 수
		for(RoomDTO roomDTO : roomDTOs) {
			MessageDTO messageDTO = new MessageDTO();
			messageDTO.setRoomNum(roomDTO.getRoomNum());
			messageDTO.setReceiveId(memberDTO.getMemberId());
			
			int unReadCnt = roomDAO.getUnreadMessageCnt(messageDTO);
			roomDTO.setUnReadCnt(unReadCnt);
		}
	}
	public int getTotalUnreadMessageCnt() {
		MessageDTO messageDTO = new MessageDTO();
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		if(memberDTO == null) {
			return 0;
		}else {
			messageDTO.setReceiveId(memberDTO.getMemberId());
			return roomDAO.getTotalUnreadMessageCnt(messageDTO);		
		}
	}
	
}
