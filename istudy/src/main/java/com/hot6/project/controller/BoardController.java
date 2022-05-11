package com.hot6.project.controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hot6.project.service.BoardService;
import com.hot6.project.service.StudyService;
import com.hot6.project.vo.BoardVO;

@Controller
public class BoardController {
	@Inject 
	BoardService Bservice;
	@Inject 
	StudyService Sservice;
	
		//글 삭제
		@GetMapping("/board/boardDelete")
		public ResponseEntity<String> boardDelete(int board_num, HttpSession session) {
		String path ="";
		int type_num = Bservice.getType_num(board_num);
		
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			// 1. 삭제할 레코드의 파일명 얻어오기
			BoardVO dbFileVO = Bservice.getFileName(board_num);
			
			// 2. 레코드 삭제
			Bservice.boardDelete(board_num);
			
			// 3. 파일 경로 설정/ 보낼 msg 입력
			String msg = "<script>alert('글이 삭제되었습니다');";
			if(type_num==1) {				
				int study_num = Bservice.getStudy_num(board_num);
				msg += "location.href='/study/study_home/mystudy/studyList?study_num="+study_num+"';</script>";
				path = session.getServletContext().getRealPath("/upload/study");
			}else if(type_num==2) {
				msg += "location.href='/qna/qnaList';</script>";
				path = session.getServletContext().getRealPath("/upload/qna");				
			}else if(type_num==3) {			
				msg += "location.href='/notice/noticeList';</script>";
				path = session.getServletContext().getRealPath("/upload/notice");
			}
			
			// 3. 파일 삭제
			if(dbFileVO.getFile1()!=null) {	
				fileDelete(path, dbFileVO.getFile1());	
			}else if(dbFileVO.getFile2()!=null) {
				fileDelete(path, dbFileVO.getFile2());
			}else if(dbFileVO.getFile3()!=null) {	
				fileDelete(path, dbFileVO.getFile3());
			}else if(dbFileVO.getFile4()!=null) {	
				fileDelete(path, dbFileVO.getFile4());
			}else if(dbFileVO.getFile5()!=null) {	
				fileDelete(path, dbFileVO.getFile5());
			}
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			
			String msg = "<script>alert('글 삭제에 실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
	//파일지우기
	public void fileDelete(String p, String f) {
		if(f != null) {	//파일명이 있을때만
			File file = new File(p, f);
			file.delete();
		}
	}
}
