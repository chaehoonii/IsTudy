package com.hot6.project.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.ArrayList;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hot6.project.service.BoardService;
import com.hot6.project.service.QnaService;
import com.hot6.project.service.StudyService;
import com.hot6.project.vo.BoardVO;

@Controller
public class BoardController {
	@Inject
	BoardService Bservice;
	@Inject
	StudyService Sservice;
	@Inject
	QnaService Qservice;

	// 글 등록
	@PostMapping("/board/boardWriteOk")
	public ResponseEntity<String> boardWriteOk(BoardVO vo, HttpServletRequest request, int study_num) {
		vo.setIp(request.getRemoteAddr()); // 접속자 아이피
		vo.setUser_id((String) request.getSession().getAttribute("logId")); // 작성자

		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));

		String msg = "<script>alert('글이 등록되었습니다');";
		int insertChk = 0;
		// 스터디 게시판
		if (vo.getBoard_type_num() == 1) {
			vo.setStudy_num(study_num);
			insertChk = Sservice.StudyboardInsert(vo);
			vo.setBoard_num(Bservice.boardNum(vo.getUser_id())); // 유저의 최신글 번호 가져오기
			//study_num = Bservice.getStudy_num(vo.getBoard_num()); // study_num 가져와야함!
			msg += "location.href='/study/studyRoom?study_num=" + study_num + "';</script>";
		} else {
			insertChk = Bservice.boardInsert(vo);
			int board_num = Bservice.boardNum(vo.getUser_id()); // 유저의 최신글 번호 가져오기
			vo.setBoard_num(board_num);
			// qna 게시판
			if (vo.getBoard_type_num() == 2) {
				msg += "location.href='/qna/qnaList';</script>";
				if (vo.getLang_list() != null) {
					Qservice.qnaLangInsert(vo); // 언어
				}

				List<String> taglist = vo.getTag_list();
				if (taglist.size() != 0) {
					// 태그 공백제거
					for (int i = 0; i < taglist.size(); i++) {
						String tag = taglist.get(i).trim(); // 공백제거한 태그
						System.out.println(tag);
						if (tag.equals("")) {
							taglist.remove(i); // 비어있는 태그 지우기
							i--;
						} else {
							taglist.set(i, tag);
						}
					}
					Qservice.qnaTagInsert(vo); // 태그
				}
				// 공지사항 게시판
			} else if (vo.getBoard_type_num() == 3) {
				msg += "location.href='/notice/noticeList';</script>";
			}
		}
		if (insertChk > 0) {
			Bservice.expUpBoard(vo.getUser_id());
			msg += "<script>alert('글이 등록되었습니다');";
			msg += "location.href='/notice/noticeList';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK); // 200
		} else {
			msg += "<script>alert('글이 등록 실패하였습니다');";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST); // 400
		}
		return entity;
	}

	// CKeditor 서버로 이미지
	// 전송하기==================================================================================
	@RequestMapping(value = "/board/imageUpload", method = RequestMethod.POST)
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload) throws Exception {

		// 랜덤 문자 생성 : 파일이름 중복 방지
		UUID uid = UUID.randomUUID();
		OutputStream out = null;
		PrintWriter printWriter = null;
		// 인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		try {
			// 파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();

			// 업로드 경로
			String path = request.getServletContext().getRealPath("/ckUpload/");
			String ckUploadPath = path + uid + "_" + fileName;
			File folder = new File(path);

			// 해당 디렉토리 확인
			if (!folder.exists()) {
				try {
					folder.mkdirs(); // 폴더 생성
				} catch (Exception e) {
					e.getStackTrace();
				}
			}
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // outputStream에 저장된 데이터를 전송하고 초기화

			printWriter = response.getWriter();
			// String callback = request.getParameter("CKEditorFuncNum");
			String fileUrl = "/board/imageSubmit?uid=" + uid + "&fileName=" + fileName; // 작성화면

			// 업로드 시 메시지 출력
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return;
	}

	// CKEditor 서버로 전송된 이미지
	// 뿌려주기==================================================================================
	@RequestMapping(value = "/board/imageSubmit", method = RequestMethod.GET)
	public void ckSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value = "fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 서버에 저장된 이미지 경로
		String path = request.getServletContext().getRealPath("/ckUpload/");
		String sDirPath = path + uid + "_" + fileName;
		File imgFile = new File(sDirPath);

		// 사진 이미지를 못 찾을 때 예외처리로 빈 이미지 파일 설정
		if (imgFile.isFile()) {
			byte[] buf = new byte[1024];
			int readByte = 0;
			int length = 0;
			byte[] imgBuf = null;

			FileInputStream fileInputStream = null;
			ByteArrayOutputStream outputStream = null;
			ServletOutputStream out = null;

			try {
				fileInputStream = new FileInputStream(imgFile);
				outputStream = new ByteArrayOutputStream();
				out = response.getOutputStream();

				while ((readByte = fileInputStream.read(buf)) != -1) {
					outputStream.write(buf, 0, readByte);
				}

				imgBuf = outputStream.toByteArray();
				length = imgBuf.length;
				out.write(imgBuf, 0, length);
				out.flush();

			} catch (IOException e) {
			} finally {
				outputStream.close();
				fileInputStream.close();
				out.close();
			}
		}
	}

	// 글 삭제==============================================================================================
	@GetMapping("/board/boardDelete")
	public ResponseEntity<String> boardDelete(int board_num, HttpSession session) {
		int type_num = Bservice.getType_num(board_num);
		String user_id = Bservice.getIdByBoardnum(board_num);
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");

		try {
			// 1. 삭제할 레코드의 파일명 얻어오기
			// BoardVO dbFileVO = Bservice.getFileName(board_num);
			// ****삭제 실행 후 보낼 경로를 설정하는 코드. (해당코드를 파일 삭제 이후 실행되도록 수정)3. 파일 경로 설정/ 보낼 msg 입력

			String msg = "<script>alert('글이 삭제되었습니다');";
			if (type_num == 1) {
				int study_num = Bservice.getStudy_num(board_num);
				msg += "location.href='/study/study_home/mystudy/studyList?study_num=" + study_num + "';</script>";
			} else if (type_num == 2) {
				msg += "location.href='/qna/qnaList';</script>";
			} else if (type_num == 3) {
				msg += "location.href='/notice/noticeList';</script>";
			}

			// 2. 게시글 삭제
			int delChk = Bservice.boardDelete(board_num);
			
			if(delChk>0) {
				Bservice.expDownBoard(user_id);
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			String msg = "<script>alert('글 삭제에 실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		System.out.println(board_num);
		return entity;

	}

	// 글 수정============================================================================================================
	@PostMapping("/board/boardEditOk")
	public ResponseEntity<String> boardEditOk(BoardVO vo, HttpSession session, HttpServletRequest request) {
		vo.setUser_id((String) session.getAttribute("logId"));
		int board_num = vo.getBoard_num();

		/// 스터디 게시판
		if (vo.getBoard_type_num() == 1) {
			int study_num = Bservice.getStudy_num(board_num); // study_num 가져와야함!
		}
		System.out.println("board_num="+board_num);
		System.out.println("type_num="+vo.getBoard_type_num());

		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
			// DB update
			// qna게시판
			if (vo.getBoard_type_num() == 2) {
				// 언어
				if (vo.getLang_list() != null) {
					Qservice.qnaLangDelete(vo);
					Qservice.qnaLangInsert(vo);
				}
				// 태그 공백제거
				List<String> taglist = vo.getTag_list();
				if (taglist.size() != 0) {
					for (int i = 0; i < taglist.size(); i++) {
						String tag = taglist.get(i).trim(); // 공백제거한 태그
						System.out.println(tag);
						if (tag.equals("")) {
							taglist.remove(i); // 비어있는 태그 지우기
							i--;
						} else {
							taglist.set(i, tag);
						}
					}
					Qservice.qnaTagDelete(vo);
					Qservice.qnaTagInsert(vo); // 태그
				}
			}
			// 공통 기능
			int updateCount = Bservice.BoardUpdate(vo);
	        
	        if(updateCount>0) {
	        	String msg = "<script>alert('글이 수정되었습니다');";
	        	if (vo.getBoard_type_num() == 1) {
	    			int study_num = Bservice.getStudy_num(board_num); // study_num 가져와야함!
	    			msg += "location.href='/study/study_home/mystudy/studyList?study_num=" + study_num + "';</script>";
	    			// qna 게시판
	    		} else if (vo.getBoard_type_num() == 2) {
	    			msg += "location.href='/qna/qnaView?board_num=" + board_num + "';</script>";
	    			// 공지사항 게시판
	    		} else if (vo.getBoard_type_num() == 3) {
	    			msg += "location.href='/notice/noticeList';</script>";
	    		}
	            entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
	            
	        } else {
	            String msg = "<script>alert('글 수정 실패하였습니다');";
	            msg +=  "history.back();</script>";
	            entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
	        }
	        return entity;
	}

	// 파일지우기==============================================================================================
	public void fileDelete(String p, String f) {
		if (f != null) { // 파일명이 있을때만
			File file = new File(p, f);
			file.delete();
		}
	}

	// 댓글
	// 리스트==============================================================================================
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/replyList", method = RequestMethod.GET)
	public List<BoardVO> qnaReplyList(@RequestParam("board_num") int board_num, HttpSession session) {
		String user_id = (String) session.getAttribute("logId");
		List<BoardVO> replylist = Bservice.replyList(user_id, board_num);
		for (BoardVO vo : replylist) {
			vo.setSolved(Qservice.getSolved(board_num));
		}
		return replylist;
	}

	// 댓글
	// 등록==============================================================================================
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/replyWrite", method = RequestMethod.POST)
	public int ReplyWrite(BoardVO vo, HttpSession session, HttpServletRequest request) {
		vo.setUser_id((String) session.getAttribute("logId"));
		vo.setIp(request.getRemoteAddr()); // 접속자 아이피
		int Chk = Bservice.replyWrite(vo);
		if(Chk>0) {
			Bservice.expUpReply(vo.getUser_id());
		}
		return Chk;
	}

	// 댓글
	// 삭제==============================================================================================
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/replyDel", method = RequestMethod.GET)
	public int replyDel(@RequestParam("reply_num") int reply_num) {
		String user_id = Bservice.getIdByReplynum(reply_num);
		int Chk = Bservice.replyDel(reply_num);
		
		if(Chk>0) {
			Bservice.expDownReply(user_id);
		}
		
		return Chk;
	}

	// 댓글
	// 수정폼==============================================================================================
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/replyEdit", method = RequestMethod.GET)
	public BoardVO replyEdit(@RequestParam("reply_num") int reply_num) {

		return Bservice.getOneReply(reply_num);
	}

	// 댓글
	// 수정==============================================================================================
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/replyEditOk", method = RequestMethod.POST)
	public int replyEditOk(BoardVO vo) {

		return Bservice.replyEditOk(vo);
	}
}
