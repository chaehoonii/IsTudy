package com.hot6.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/")
public class AdminNoticeController {
	ModelAndView mav = new ModelAndView();
	
	@GetMapping(value="/notice/noticeWrite")
	public ModelAndView noticeWrite() {
		
		mav.setViewName("/admin/notice/adminNoticeWrite");
		return mav;
	}
	
}
