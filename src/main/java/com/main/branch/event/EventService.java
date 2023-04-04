package com.main.branch.event;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.main.branch.util.FileManager;

@Service
public class EventService {
	
	@Autowired
	private EventDAO eventDAO;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private FileManager fileManager;
	
	public List<EventDTO> getEventList() {
		return eventDAO.getEventList();
	}
	public int setEventAdd(MultipartFile[] multipartFiles) throws Exception {
		int result = 0;
		
		if(multipartFiles != null) {
			for(MultipartFile multipartFile : multipartFiles) {
				String realPath = servletContext.getRealPath("/resources/upload/event/");
				realPath = fileManager.fileSave(multipartFile, realPath);
				
				EventDTO eventDTO = new EventDTO();
				eventDTO.setFileName(realPath);
				eventDTO.setOriName(multipartFile.getOriginalFilename());
				result = eventDAO.setEventAdd(eventDTO);
			}
		}
		return result;	
	}
	public int setEventDelete(EventDTO eventDTO) {
		return eventDAO.setEventDelete(eventDTO);
	}
	
	public int setEventUpdate(MultipartFile multipartFile, EventDTO eventDTO) {
		return eventDAO.setEventUpdate(eventDTO);
	}
}
