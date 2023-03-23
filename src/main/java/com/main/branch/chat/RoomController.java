package com.main.branch.chat;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.member.MemberDTO;

@Controller
@RequestMapping("/chat/**")
public class RoomController {
	@Autowired
	private RoomService roomService;
	@Autowired
	private HttpSession httpSession;
	
	// 방 만들기..
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
		modelAndView.setViewName("redirect: ./myRoomList");
		return modelAndView;
	}
	
	// 내가 참가하고 있는 룸 리스트
	@GetMapping("/myRoomList")
	public ModelAndView getMyRoomList() {
		ModelAndView modelAndView = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		List<RoomDTO> roomDTOs = roomService.getMyRoomList(memberDTO);
		
		modelAndView.addObject("roomDTOs", roomDTOs);
		modelAndView.setViewName("/chat/myRoomList");
		return modelAndView;
	}
	
	// 사용자가 어떤 룸에 들어왔을때
	@GetMapping("/room")
	public ModelAndView startChat(MessageDTO messageDTO) {
		ModelAndView modelAndView = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		messageDTO.setReceiveId(memberDTO.getMemberId());
		
		List<MessageDTO> messageDTOs = roomService.getRoomMessageList(messageDTO);
		
		modelAndView.addObject("messageDTOs", messageDTOs);
		modelAndView.setViewName("/chat/room");
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
	
}
