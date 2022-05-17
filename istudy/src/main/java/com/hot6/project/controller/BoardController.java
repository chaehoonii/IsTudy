package com.hot6.project.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.ArrayList;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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
	
	//글 등록
	@PostMapping("/board/boardWriteOk")
	public ResponseEntity<String> boardWriteOk(BoardVO vo, HttpServletRequest request) {
		vo.setIp(request.getRemoteAddr()); // 접속자 아이피
		vo.setUser_id((String)request.getSession().getAttribute("logId"));	// 작성자
		
		// 파일 업로드에 관련된 multipartRequest객체
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
		
		// 파일업로드를 위한 업로드 위치의 절대주소
		String path="";
		String msg = "<script>alert('글이 등록되었습니다');";
		
		//스터디 게시판			
		if(vo.getBoard_type_num()==1) {	
			Sservice.StudyboardInsert(vo);
			vo.setBoard_num(Bservice.boardNum(vo.getUser_id())); //유저의 최신글 번호 가져오기
			int study_num = Bservice.getStudy_num(vo.getBoard_num());	//study_num 가져와야함!
			path = request.getSession().getServletContext().getRealPath("/upload/study");
			msg += "location.href='/study/study_home/mystudy/studyList?study_num="+study_num+"';</script>";			
		}else {
			Bservice.boardInsert(vo);
			int board_num = Bservice.boardNum(vo.getUser_id()); //유저의 최신글 번호 가져오기
			vo.setBoard_num(board_num);
		//qna 게시판
			if(vo.getBoard_type_num()==2) { 
				path = request.getSession().getServletContext().getRealPath("/upload/qna");
				msg += "location.href='/qna/qnaList';</script>";
				if(vo.getLang_list()!=null) {
					Qservice.qnaLangInsert(vo); //언어
				}
				
				List<String> taglist = vo.getTag_list();
				if(taglist.size()!=0) {
					//태그 공백제거
					for(int i=0; i<taglist.size(); i++) {
						String tag = taglist.get(i).trim(); //공백제거한 태그
						System.out.println(tag);
						if(tag.equals("")) {
							taglist.remove(i);	//비어있는 태그 지우기
							i--;
						}else {
							taglist.set(i, tag);
						}
					}
					Qservice.qnaTagInsert(vo); //태그
				}
			//공지사항 게시판	
			}else if(vo.getBoard_type_num()==3) { 
				path = request.getSession().getServletContext().getRealPath("/upload/notice");
				msg += "location.href='/notice/noticeList';</script>";
			}
		}
		
		//파일 등록
		try {		
			System.out.println("path -> "+path);
			System.out.println("try문");
			// 파일 업로드를 처리하기 위해서 request 객체에서 multipart객체를 구하여야 한다.
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			//mr에 파일의 수만큼 MultipartFile객체가존재한다
			List<MultipartFile> files = mr.getFiles("filename");
			System.out.println("업로드 파일 수 -> "+files.size());
			
			if(files.size()!=0) {	//if 111
				int cnt = 1;	// 4번에서 업로드 순서에 따라 filename1, filename2 파일명을 대입하기 위한 변수
				//첨부파일수 만큼 반복하여 업로드한다.
				for(int i=0; i<files.size(); i++) {	// for 222
					//	1. MultipartFile객체 얻어오기
					MultipartFile mf = files.get(i);
					
					//	2. 업로드한 실제 파일명을 구하기
					String orgFileName = mf.getOriginalFilename();
					System.out.println("orgFileName -> "+ orgFileName );
					
					//	3. rename하기
					if(orgFileName!=null && !orgFileName.equals("")) {	//if 333, 파일명이 존재하면
						File f = new File(path, orgFileName);
						
						//	파일이 존재하는 지 확인	true:파일이 존재/	false:파일 없음
						if(f.exists()) {	//if 444
							for(int renameNum=1;; renameNum++) {	//for 555
								//	확장자와 파일을 분리한다.
								int point = orgFileName.lastIndexOf(".");
								String fileName = orgFileName.substring(0, point);
								String ext = orgFileName.substring(point+1);
								
								f = new File(path, fileName+" ("+renameNum+")."+ext);
								if(!f.exists()) {	//if 666 , 새로 생성된 파일 객체가 없으면
									orgFileName = f.getName();
									break;
								}	//if 666
								
							}	//for 555
							
						}	//if 444
						//	4. 파일 업로드 구현
						try {
							mf.transferTo(f);	// 실제 업로드가 일어나는(발생하는) 시점
							System.out.println(f);
						}catch(Exception ee) {
							ee.printStackTrace();
						}
						
						//	5. 업로드한(새로운파일명) vo에 셋팅
						if(cnt==1) vo.setFile1(orgFileName);
						if(cnt==2) vo.setFile2(orgFileName);
						if(cnt==3) vo.setFile3(orgFileName);
						if(cnt==4) vo.setFile4(orgFileName);
						cnt++;
					}	//if 333
					
				}// for 222
				
				//DB등록
				Bservice.boardFileInsert(vo);
			}//	if 111
			//레코드 추가 성공
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200			
		}catch(Exception e) {
			e.printStackTrace();
			//레코드 추가실패
			//파일을지우기
				fileDelete(path, vo.getFile1());
				fileDelete(path, vo.getFile2());
				fileDelete(path, vo.getFile3());
				fileDelete(path, vo.getFile4());
			//메세지
			msg = "<script>alert('글 등록에 실패하였습니다');history.back();</script>";
			//이전페이지로 보내기
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);	//400
		}
		return entity;
	
	}
		//글 삭제==============================================================================================
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
			}
			
			// 3. 파일 삭제
			if(dbFileVO.getFile1()!=null) {	
				fileDelete(path, dbFileVO.getFile1());	
			}
			if(dbFileVO.getFile2()!=null) {
				fileDelete(path, dbFileVO.getFile2());
			}
			if(dbFileVO.getFile3()!=null) {	
				fileDelete(path, dbFileVO.getFile3());
			}
			if(dbFileVO.getFile4()!=null) {	
				fileDelete(path, dbFileVO.getFile4());
			}
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			
			String msg = "<script>alert('글 삭제에 실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}
		//글 수정============================================================================================================
		@PostMapping("/board/boardEditOk")
		public ResponseEntity<String> boardEditOk(BoardVO vo, HttpSession session, HttpServletRequest request) {
			vo.setUser_id((String) session.getAttribute("logId"));
			int board_num = vo.getBoard_num();
			
			String msg="";
			///스터디 게시판			
			if(vo.getBoard_type_num()==1) {	
				int study_num = Bservice.getStudy_num(board_num);	//study_num 가져와야함!
				//(url고치기)
				msg += "location.href='/study/study_home/mystudy/studyList?study_num="+study_num+"';</script>";			
			//qna 게시판
			}else if(vo.getBoard_type_num()==2){
				msg += "location.href='/qna/qnaView?board_num="+board_num+"';</script>";
			//공지사항 게시판
			}else if(vo.getBoard_type_num()==3){
				msg += "location.href='/notice/noticeList';</script>";
			}
			ResponseEntity<String> entity = null;
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=UTF-8");

			// DB update
			
			//공통 기능
			Bservice.BoardUpdate(vo);

			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			return entity;
		}
		//글 수정============================================================================================================
		@PostMapping("/board/boardEditOk")
		public ResponseEntity<String> boardEditOk(BoardVO vo, HttpSession session, HttpServletRequest request) {
			vo.setUser_id((String) session.getAttribute("logId"));
			int board_num = vo.getBoard_num();
			
			// 파일업로드를 위한 업로드 위치의 절대주소
			String path="";
			String msg = "<script>alert('글이 수정되었습니다');";
			
			///스터디 게시판			
			if(vo.getBoard_type_num()==1) {	
				int study_num = Bservice.getStudy_num(board_num);	//study_num 가져와야함!
				path = request.getSession().getServletContext().getRealPath("/upload/study");
				//(url고치기)
				msg += "location.href='/study/study_home/mystudy/studyList?study_num="+study_num+"';</script>";			
			//qna 게시판
			}else if(vo.getBoard_type_num()==2){
				path = request.getSession().getServletContext().getRealPath("/ckUpload/qna");
				msg += "location.href='/qna/qnaView?board_num="+board_num+"';</script>";
			//공지사항 게시판
			}else if(vo.getBoard_type_num()==3){
				path = request.getSession().getServletContext().getRealPath("/ckUpload/notice");
				msg += "location.href='/notice/noticeList';</script>";
			}
			ResponseEntity<String> entity = null;
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=UTF-8");

			List<String> newUpload = new ArrayList<String>(); // 폼에서 온 파일중 게시물에 없는 파일만 넣은 리스트
			try {
				// DB에서 파일명 가져오기
				BoardVO dbfileVO = Bservice.getFileName(board_num);

				// 새로 업로드 하기
				MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;

				// 새로 업로드된 MultipartFile객체를 얻어오기
				List<MultipartFile> newFileList = mr.getFiles("filename");
				if (newFileList != null) { // 새로 업로드 된 파일이 있으면
					for (int i = 0; i < newFileList.size(); i++) {
						MultipartFile newMf = newFileList.get(i);
						String newUploadFilename = newMf.getOriginalFilename();
						System.out.println((i + 1) + "번째 파일 -> " + newUploadFilename);
						// 리네임 작업
						if (newUploadFilename != null && !newUploadFilename.equals("")) {
							File f = new File(path, newUploadFilename);

							if (f.exists()) {
								// 있으면 여기서 rename
								for (int n = 1;; n++) {
									int point = newUploadFilename.lastIndexOf(".");
									String fileNameNoExt = newUploadFilename.substring(0, point);
									String ext = newUploadFilename.substring(point + 1);

									// 새로운 파일명 만들어 존재유무 확인
									String nf = fileNameNoExt + " (" + n + ")." + ext;
									f = new File(path, nf);
									if (!f.exists()) { // 없으면
										newUploadFilename = nf;
										break;
									}
								} // for
							}
							// 업로드
							try {
								newMf.transferTo(f);
								newUpload.add(newUploadFilename);
							} catch (Exception ee) {
								ee.printStackTrace();
							}

							if(i==0) {
								if(dbfileVO.getFile1()!=null) {
									fileDelete(path, dbfileVO.getFile1());
								}
								dbfileVO.setFile1(newUploadFilename);
							}
							if(i==1) {
								if(dbfileVO.getFile2()!=null) {
									fileDelete(path, dbfileVO.getFile2());
								}
								dbfileVO.setFile2(newUploadFilename);
							}
							if(i==2) {
								if(dbfileVO.getFile3()!=null) {
									fileDelete(path, dbfileVO.getFile3());
								}
								dbfileVO.setFile3(newUploadFilename);
							}
							if(i==3) {
								if(dbfileVO.getFile4()!=null) {
									fileDelete(path, dbfileVO.getFile4());
								}
								dbfileVO.setFile4(newUploadFilename);
							}
						} // if
						else {
						}
					}
				}
				dbfileVO.setBoard_num(board_num);
				// DB update
				//qna게시판
				if(vo.getBoard_type_num()==2) {
					//언어
					if(vo.getLang_list()!=null) {
						Qservice.qnaLangDelete(vo);
						Qservice.qnaLangInsert(vo); 
					}
					//태그 공백제거					
					List<String> taglist = vo.getTag_list();
					if(taglist.size()!=0) {
						for(int i=0; i<taglist.size(); i++) {
							String tag = taglist.get(i).trim(); //공백제거한 태그
							System.out.println(tag);
							if(tag.equals("")) {
								taglist.remove(i);	//비어있는 태그 지우기
								i--;
							}else {
								taglist.set(i, tag);
							}
						}
						Qservice.qnaTagDelete(vo);
						Qservice.qnaTagInsert(vo); //태그
					}
				}
				//공통 기능
				Bservice.BoardUpdate(vo);
				Bservice.BoardFileUpdate(dbfileVO);

				entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);

			} catch (Exception e) {
				e.printStackTrace();
				// DB잘못수정했을때
				for (String fname : newUpload) {
					fileDelete(path, fname);
				}

				// 수정페이지로 이동
				msg = "<script>";
				msg += "alert('글 수정 실패하였습니다'\\n수정폼으로 이동합니다)";
				msg += "history.back();</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
			}

			return entity;
		}
	//파일지우기==============================================================================================
	public void fileDelete(String p, String f) {
		if(f != null) {	//파일명이 있을때만
			File file = new File(p, f);
			file.delete();
		}
	}
	//댓글 리스트==============================================================================================
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/replyList", method = RequestMethod.GET)
	public List<BoardVO> qnaReplyList(@RequestParam("board_num") int board_num, HttpSession session) {
		String user_id = (String)session.getAttribute("logId");
		List<BoardVO> replylist = Bservice.replyList(user_id, board_num);
		for(BoardVO vo : replylist) {
			vo.setSolved(Qservice.getSolved(board_num));
		}
		return replylist;
	}
	//댓글 등록==============================================================================================
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/replyWrite", method = RequestMethod.POST)
	public int ReplyWrite(BoardVO vo, HttpSession session, HttpServletRequest request) {
		vo.setUser_id((String)session.getAttribute("logId"));
		vo.setIp(request.getRemoteAddr()); // 접속자 아이피
				
		return Bservice.replyWrite(vo);
	}
	//댓글 삭제==============================================================================================
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/replyDel", method = RequestMethod.GET)
	public int replyDel(@RequestParam("reply_num") int reply_num) {
		
		return Bservice.replyDel(reply_num);
	}
	//댓글 수정폼==============================================================================================
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/replyEdit", method = RequestMethod.GET)
	public BoardVO replyEdit(@RequestParam("reply_num") int reply_num) {
		
		return Bservice.getOneReply(reply_num);
	}
	//댓글 수정==============================================================================================
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/replyEditOk", method = RequestMethod.POST)
	public int replyEditOk(BoardVO vo) {
				
		return Bservice.replyEditOk(vo);
	}
}
