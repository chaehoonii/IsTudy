package com.hot6.project.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.BoardService;
import com.hot6.project.service.NoticeService;
import com.hot6.project.service.QnaService;
import com.hot6.project.service.StudyService;
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

	//글 등록
	@PostMapping("/notice/noticeWriteOk")
	public ResponseEntity<String> boardWriteOk(BoardVO vo, HttpServletRequest request) {
		vo.setIp(request.getRemoteAddr()); // 접속자 아이피
		vo.setUser_id((String) request.getSession().getAttribute("logId")); // 작성자
		vo.setBoard_type_num(3);
		// 파일 업로드에 관련된 multipartRequest객체
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));

		// 파일업로드를 위한 업로드 위치의 절대주소
		String msg = "";

		int insertChk = Bservice.boardInsert(vo);
		// 스터디 게시판
		if (insertChk > 0) {
			msg += "<script>alert('글이 등록되었습니다');";
			msg += "location.href='/notice/noticeList';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK); // 200
		} else {
			msg += "<script>alert('글이 등록 실패하였습니다');";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST); // 400
		}
		return entity;

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
	
	@PutMapping(value="/notice/noticeEditOk")
	public void noticeEditOk() {
		
	}

}
