package com.hot6.project.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.BoardService;
import com.hot6.project.service.NoticeService;
import com.hot6.project.vo.BoardVO;

@Controller
@RequestMapping("/admin/")
public class AdminNoticeController {
	@Inject
	BoardService Bservice;
	@Inject
	NoticeService Nservice;

	ModelAndView mav = new ModelAndView();
	
	//공지사항 글쓰기 페이지 이동
	@GetMapping(value = "/notice/noticeWrite")
	public ModelAndView noticeWrite() {

		mav.setViewName("/admin/notice/adminNoticeWrite");
		return mav;
	}

	//글 수정
	@GetMapping(value ="/notice/noticeEdit")
	public ModelAndView noticeEdit(int board_num) {
		// DB에 있는 첨부파일 수 구하기(새로 변경한 파일이 생기면 --해줘야 하기 때문)
		BoardVO vo = Nservice.selectNoticeModal(board_num);
		mav.addObject("vo", vo);
		mav.setViewName("/admin/notice/adminNoticeEdit");
		return mav;
	}

}
