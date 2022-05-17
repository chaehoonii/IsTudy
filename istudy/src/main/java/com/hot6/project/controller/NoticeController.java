package com.hot6.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.BoardService;
import com.hot6.project.service.NoticeService;
import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.PagingVO;
import com.hot6.project.vo.StudyVO;

@Controller
@RequestMapping("/notice/")
public class NoticeController {
	@Inject
	NoticeService NoticeService;
	
	@Inject
	BoardService BoardService;
	
	ModelAndView mav = new ModelAndView();
	
	//공지사항 리스트
	@GetMapping(value="noticeList")
	public ModelAndView noticeMain(BoardVO vo, PagingVO pvo){
		
		pvo.setTotalRecord(NoticeService.setTotalRecord(3));
		
		List<BoardVO> noticeList = NoticeService.selectNoticeList(pvo);
		
		
		mav.addObject("pvo", pvo);
		mav.addObject("noticeList", noticeList);
		mav.setViewName("/notice/noticeList");
		return mav;
	}
	
	@ResponseBody // Ajax
	@RequestMapping(value = "noticeListModal", method = RequestMethod.GET)
	public BoardVO noticeModal(@RequestParam("board_num") int board_num) {
		return NoticeService.selectNoticeModal(board_num);
	}
}
