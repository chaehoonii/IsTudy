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
import javax.servlet.http.HttpSession;

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
		System.out.println(board_num);
		mav.addObject("vo", vo);
		mav.setViewName("/admin/notice/adminNoticeEdit");
		return mav;
	}
	
	//글 수정
	@PostMapping(value="/notice/noticeEditOk")
	public ResponseEntity<String> noticeEditOk(BoardVO vo, HttpSession session, HttpServletRequest request) {
		vo.setUser_id((String) session.getAttribute("logId"));
		
		String msg = "<script>";
		
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		int updateCount = Bservice.BoardUpdate(vo);
		
		if(updateCount>0) {
			msg += "alert('글 수정 성공했습니다');";
			msg += "location.href='/notice/noticeList';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		} else {
			msg += "alert('글 수정 실패하였습니다');";
			msg +=  "history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//CKeditor 서버로 이미지 전송하기
	@RequestMapping(value = "/imageUpload", method = RequestMethod.POST)
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
			String ckUploadPath = path + "/notice/" + uid + "_" + fileName;
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
			String fileUrl = "/admin/imageSubmit?uid=" + uid + "&fileName=" + fileName; // 작성화면

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

	// CKEditor 서버로 전송된 이미지 뿌려주기
	@RequestMapping(value = "/imageSubmit", method = RequestMethod.GET)
	public void ckSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value = "fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 서버에 저장된 이미지 경로
		String path = request.getServletContext().getRealPath("/ckUpload/notice/");
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
	
}
