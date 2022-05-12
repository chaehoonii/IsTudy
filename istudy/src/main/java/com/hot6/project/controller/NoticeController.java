package com.hot6.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.NoticeService;
import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.PagingVO;

@Controller
@RequestMapping("/notice/")
public class NoticeController {
	@Inject
	NoticeService service;
	ModelAndView mav = new ModelAndView();
	
	@GetMapping(value="noticeList")
	public ModelAndView noticeMain(BoardVO vo, PagingVO pvo) {
		
		pvo.setTotalRecord(service.setTotalRecord(3));
		
		List<BoardVO> noticeList = service.selectNoticeList(vo, pvo);
		
		mav.addObject("pvo", pvo);
		mav.addObject("noticeList", noticeList);
		mav.setViewName("/notice/noticeList");
		return mav;
	}
}
