package com.main.branch;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.main.branch.board.BoardDAO;
import com.main.branch.board.BoardDTO;
import com.main.branch.board.BoardService;
import com.main.branch.chat.RoomService;
import com.main.branch.event.EventDAO;
import com.main.branch.event.EventDTO;
import com.main.branch.notice.NoticeDAO;
import com.main.branch.notice.NoticeDTO;
import com.main.branch.notice.NoticeService;
import com.main.branch.product.ProductDAO;
import com.main.branch.product.ProductDTO;

@Controller
public class HomeController {
	
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private EventDAO eventDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private BoardService boardService;
	@Autowired
	private RoomService roomService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		List<NoticeDTO> noticeTopDTOs = noticeService.getNoticeTopList();
		modelAndView.addObject("noticeTopDTOs", noticeTopDTOs);
		
		List<EventDTO> eventDTOs = eventDAO.getEventList();
		modelAndView.addObject("eventDTOs", eventDTOs);
		
		List<ProductDTO> productDTOs = productDAO.getProductTopList();
		modelAndView.addObject("productDTOs", productDTOs);
		
		List<BoardDTO> boardSellTopDTOs = boardService.getBoardSellTopList();
		modelAndView.addObject("boardSellTopDTOs", boardSellTopDTOs);
		
		List<BoardDTO> boardBuyTopDTOs = boardService.getBoardBuyTopList();
		modelAndView.addObject("boardBuyTopDTOs", boardBuyTopDTOs);
		
		modelAndView.setViewName("/home");
		return modelAndView;
	}
	
	@GetMapping(value = "/oops")
	public String oops() {
		return "/oops";
	}
	
}
