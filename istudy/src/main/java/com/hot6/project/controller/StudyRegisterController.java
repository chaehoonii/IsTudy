package com.hot6.project.controller;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.StudyRegisterService;
import com.hot6.project.vo.StudyVO;

@RestController
@RequestMapping("/studyregister/")
public class StudyRegisterController {
	@Inject 
	StudyRegisterService service; //inject : 객체를 만들어 반환
		
	////////////////////////////////////////스터디 폼/////////////////////////////////////////////
	@GetMapping("registerform")
	public ModelAndView studyRegisterWrite0() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("studyregister/registerform");
		
		return mav;
	}

////////////////////////////////////////스터디 등록/////////////////////////////////////////////
	@PostMapping("studyRegisterOk")
	public ResponseEntity<String> studyRegisterOk(StudyVO vo,@RequestParam("mstudy_img") MultipartFile mstudy_img, HttpServletRequest request, HttpSession session) {
		vo.setIp(request.getRemoteAddr());//접속자 IP
		//글쓴이-session로그인 아이디를 구한다
		vo.setHost_id((String)request.getSession().getAttribute("logId"));
		vo.setIs_mentor("T"); //로직 처리 필요함
		
		ResponseEntity<String> entity =null;
		
		String pathName;
		
		// 프로필 이미지 설정 X -> profile 자동설정
				if (mstudy_img.isEmpty()) {
					pathName = "study_default.png";
					vo.setStudy_img(pathName);
					int cnt = service.studyInsert(vo, pathName);
					session.setAttribute("logImg", pathName);
					String msg = "<script>";
					msg+="alert('스터디가 등록되었습니다>_<');";
					msg+="location.href='/study/study_home';";
					msg+="</script>";
					entity = new ResponseEntity<String>(msg,HttpStatus.OK);//(문자열,인코딩타입,HttpStatus.OK : 200)
					return entity;
				}
				
				if (vo.getLang_list() != null) {
					service.studyLangInsert(vo); // 언어
				}

				/*
				 * List<String> taglist = vo.getTag_list(); if (taglist.size() != 0) { // 태그
				 * 공백제거 for (int i = 0; i < taglist.size(); i++) { String tag =
				 * taglist.get(i).trim(); // 공백제거한 태그 System.out.println(tag); if
				 * (tag.equals("")) { taglist.remove(i); // 비어있는 태그 지우기 i--; } else {
				 * taglist.set(i, tag); } } service.studyTagInsert(vo); // 태그 }
				 */
			
				String filePath = session.getServletContext().getRealPath("/upload/study_room");//Paths.get(fileRealPath + user_img.getName());
				String fileName=mstudy_img.getOriginalFilename();
				int idx=fileName.lastIndexOf(".");
				if(idx>0) {
					fileName=fileName.substring(0, idx)+"_"+vo.getUser_id()+fileName.substring(idx);//test_hong.png
					System.out.println("fileName: "+fileName);
				}
				try {
					//Files.write(filePath, user_img.getBytes());
					mstudy_img.transferTo(new File(filePath, fileName));//파일 업로드 	
					System.out.println(filePath + "경로에 이미지가 저장됨");
					// getBytes가 이미지 실체고 이걸 파일로 변환해서 저장해야한다.
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				session.setAttribute("logImg", fileName);

		try {
			vo.setStudy_img(fileName);
			System.out.println(vo);
			service.studyInsert(vo, fileName);
			System.out.println("등록완료");
			//정상구현
			String msg = "<script>";
			msg+="alert('스터디가 등록되었습니다>_<');";
			msg+="location.href='/study/study_home';";
			msg+="</script>";
			entity = new ResponseEntity<String>(msg,HttpStatus.OK);//(문자열,인코딩타입,HttpStatus.OK : 200)
			
			
		}catch(Exception e){
			e.printStackTrace();
			//등록안됨..
			String msg = "<script>";
			msg+="alert('스터디 등록 실패하였습니다 ㅠ_ㅠ');";
			msg+="history.back();";
			msg+="</script>";
			entity = new ResponseEntity<String>(msg,HttpStatus.BAD_REQUEST);
		}
		return entity;		
	}

}
