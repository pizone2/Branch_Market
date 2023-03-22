package com.main.branch.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomService {
	@Autowired
	private RoomDAO chatDAO;
	
	public List<MessageDTO> getRoomMessageList(RoomDTO roomDTO){
		return chatDAO.getRoomMessageList(roomDTO);
	}
}
