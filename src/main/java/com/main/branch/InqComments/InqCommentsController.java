package com.main.branch.InqComments;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/inqComments/**")
public class InqCommentsController {
	@Autowired
	private InqCommentsService inqCommentsService;
	
	
}
