package com.main.branch.chat;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.member.MemberDTO;
import com.main.branch.util.Pager;

@Controller
@RequestMapping("/chat/**")
public class RoomController {
	@Autowired
	private RoomService roomService;
	@Autowired
	private RoomDAO roomDAO;
	@Autowired
	private HttpSession httpSession;
	
	// (-3 1:1 채팅 존재여부 -2 1:1채팅멤버, -1 1:n채팅멤버  0 안읽음, 1읽음)
	
	@GetMapping("/roomAdd")
	public ModelAndView setRoomAdd() {
		ModelAndView modelAndView = new ModelAndView();		
		modelAndView.setViewName("/chat/roomAdd");
		return modelAndView;
	}
	@PostMapping("/roomAdd")
	public ModelAndView setRoomAdd(String[] participants,RoomDTO roomDTO) {
		ModelAndView modelAndView = new ModelAndView();
		
		int result = roomService.setRoomAdd(participants, roomDTO);
		modelAndView.setViewName("redirect: ./room/" + roomDTO.getRoomNum());
		return modelAndView;
	}
	
	// 내가 참가하고 있는 룸 리스트
	@GetMapping("/myRoomList")
	public ModelAndView getMyRoomList(Pager pager) {
		ModelAndView modelAndView = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		pager.setMemberId(memberDTO.getMemberId());
		
		List<RoomDTO> roomDTOs = roomService.getMyRoomList(pager);
		
		// 방 별로 읽지읺는 메세지 수
		roomService.setUnreadMessageCnt(roomDTOs);
		
		modelAndView.addObject("roomDTOs", roomDTOs);
		modelAndView.setViewName("/chat/myRoomList");
		return modelAndView;
	}
	
	// 사용자가 어떤 룸에 들어왔을때 1:n 일때만
	@GetMapping(value = "/room/{roomNum}")
	public ModelAndView startChat(@PathVariable Integer roomNum) {
		ModelAndView modelAndView = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		MessageDTO messageDTO = new MessageDTO();
		
		int right = roomService.checkOneToOneChat(roomNum);
		if(right == 0) {
			modelAndView.setViewName("redirect: ../roomList");
			return modelAndView;
		}
		
		messageDTO.setRoomNum(roomNum);
		System.out.println("room start  " + messageDTO.getRoomNum());	
		messageDTO.setReceiveId(memberDTO.getMemberId());
		
		// 메세지 뿌리기
		List<MessageDTO> messageDTOs = roomService.getRoomMessageList(messageDTO);
		modelAndView.addObject("messageDTOs", messageDTOs);
		
		// 처음 들어오는 사람일때
		messageDTO.setSendId(memberDTO.getMemberId());
		messageDTO = roomDAO.checkAlreadyParticipant(messageDTO);
		if(messageDTO == null) {
			roomService.setMemberInviteRoom(roomNum,memberDTO.getMemberId(),-1);
		}
		modelAndView.setViewName("/chat/room");
		
		// 1 : 1 채팅인지 확인해서 초대하기 버튼 없애기
		MessageDTO oneToOneChat = new MessageDTO();
		oneToOneChat.setRoomNum(roomNum);
		oneToOneChat = roomDAO.checkOneToOneChat(messageDTO);
		modelAndView.addObject("oneToOneChat", oneToOneChat);
		
		// 받은 메세지 읽음으로 바꾸기
		roomService.updateMemberRead(roomNum);
		
		return modelAndView;
	}
	
	// 사용자가 메세지를 보냈을때
	@PostMapping("/messageAdd")
	public ModelAndView setRoomMessageAdd(MessageDTO messageDTO) {
		ModelAndView modelAndView = new ModelAndView();
		
		int result = roomService.setRoomMessageAdd(messageDTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/common/ajaxResult");
		return modelAndView;
	}
	// roomNum 받음
	@PostMapping("/getRoomMessageList")
	public ModelAndView getRoomMessageList(MessageDTO messageDTO) {
		ModelAndView modelAndView = new ModelAndView();
		
		// 메세지 뿌리기
		List<MessageDTO> messageDTOs = roomService.getRoomMessageList(messageDTO);
		
		modelAndView.addObject("messageDTOs", messageDTOs);
		modelAndView.setViewName("/common/roomMessageList");
		
		return modelAndView;
	}
	
	// 1 : n 모든 채팅방 보기
	@GetMapping("/roomList")
	public ModelAndView getRoomList(Pager pager) {
		ModelAndView modelAndView = new ModelAndView();
		List<RoomDTO> roomDTOs = roomService.getRoomList(pager);
		modelAndView.addObject("roomDTOs", roomDTOs);
		
		modelAndView.setViewName("/chat/roomList");
		return modelAndView;
	}
	

	
	// 1 : 1 채팅방이 이미 있는지 없는지 체크, 매개변수는 대화 신청받은 사람 sendId, receiveId 둘다 매개변수로 받음
	@PostMapping("/oneToOneChat")
	public ModelAndView setOneToOneChat(MessageDTO messageDTO) {
		ModelAndView modelAndView = new ModelAndView();
		RoomDTO roomDTO = roomService.setOneToOneChat(messageDTO);
		
		modelAndView.addObject("result", roomDTO.getRoomNum());
		modelAndView.setViewName("/common/ajaxResult");
		return modelAndView;
	}
	// roomNum 받아옴
	@PostMapping("/delRecordMessage")
	public ModelAndView delRecordMessage(MessageDTO messageDTO) {
		ModelAndView modelAndView = new ModelAndView();
		
		int result = roomService.delRecordMessage(messageDTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/common/ajaxResult");
		return modelAndView;
	}
	// 초대하기
	@PostMapping("/memberInviteRoom")
	public ModelAndView setMemberInviteRoom(Integer roomNum, String memberId) {
		ModelAndView modelAndView = new ModelAndView();
		
		int result = roomService.setMemberInviteRoom(roomNum, memberId,-1);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/common/ajaxResult");
		return modelAndView;
	}
	
	// roomNum 받아옴
	@PostMapping("/quitRoom")
	public ModelAndView setQuitRoom(MessageDTO messageDTO) {
		ModelAndView modelAndView = new ModelAndView();
		
		int result = roomService.setQuitRoom(messageDTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/common/ajaxResult");
		return modelAndView;
	}
	// 세션에 존재하는 사람은 읽음표시 업데이트
	@PostMapping("/updateMemberRead")
	public ModelAndView updateMemberRead(MessageDTO messageDTO) {
		ModelAndView modelAndView = new ModelAndView();
		int result = roomService.updateMemberRead(messageDTO.getRoomNum());
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/common/ajaxResult");
		return modelAndView;
	}
	
	@PostMapping("/totalUnreadMessageCnt")
	public ModelAndView getTotalUnreadMessageCnt() {
		ModelAndView modelAndView = new ModelAndView();
		
		int result = roomService.getTotalUnreadMessageCnt();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/common/ajaxResult");
		
		return modelAndView;
	}
}
