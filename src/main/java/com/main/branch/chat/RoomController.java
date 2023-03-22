package com.main.branch.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/chat/**")
public class RoomController {
	@Autowired
	private RoomService roomService;
	
	@GetMapping("/room")
	public ModelAndView startChat(RoomDTO roomDTO) {
		ModelAndView modelAndView = new ModelAndView();
		
		List<MessageDTO> messageDTOs = roomService.getRoomMessageList(roomDTO);
		
		modelAndView.addObject("messageDTOs", messageDTOs);
		modelAndView.setViewName("/chat/room");
		return modelAndView;
	}
	
}
