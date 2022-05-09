package com.hot6.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.NoticeService;
import com.hot6.project.vo.BoardVO;

@Controller
@RequestMapping("/notice/")
public class NoticeController {
	@Inject
	NoticeService service;
	ModelAndView mav = new ModelAndView();
	
	@GetMapping(value="noticeList")
	public ModelAndView adminMain(BoardVO vo) {
		List<BoardVO> noticeList = service.selectNoticeList(vo);
		
		mav.addObject("noticeList", noticeList);
		mav.setViewName("/notice/noticeList");
		return mav;
	}
}
