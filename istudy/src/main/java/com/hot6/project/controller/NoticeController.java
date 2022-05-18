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

@Controller
@RequestMapping("/notice/")
public class NoticeController {
	@Inject
	NoticeService NoticeService;

	@Inject
	BoardService BoardService;

	ModelAndView mav = new ModelAndView();

	// 공지사항 리스트
	@GetMapping(value = "noticeList")
	public ModelAndView noticeMain(BoardVO vo, PagingVO pvo) {

		pvo.setTotalRecord(NoticeService.setTotalRecord(3));

		List<BoardVO> noticeList = NoticeService.selectNoticeList(pvo);

		mav.addObject("pvo", pvo);
		mav.addObject("noticeList", noticeList);
		mav.setViewName("/notice/noticeList");
		return mav;
	}

	// 공지사항 글쓰기 페이지 이동
	@GetMapping(value = "/noticeWrite")
	public ModelAndView noticeWrite() {

		mav.setViewName("/notice/adminNoticeWrite");
		return mav;
	}
	
	//글 수정
		@GetMapping(value ="/noticeEdit")
		public ModelAndView noticeEdit(int board_num) {
			// DB에 있는 첨부파일 수 구하기(새로 변경한 파일이 생기면 --해줘야 하기 때문)
			BoardVO vo = NoticeService.selectNoticeModal(board_num);
			System.out.println(board_num);
			mav.addObject("vo", vo);
			mav.setViewName("/notice/adminNoticeEdit");
			return mav;
		}
	

	@ResponseBody // Ajax
	@RequestMapping(value = "noticeListModal", method = RequestMethod.GET)
	public BoardVO noticeModal(@RequestParam("board_num") int board_num) {
		return NoticeService.selectNoticeModal(board_num);
	}
}
