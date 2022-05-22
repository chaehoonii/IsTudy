package com.hot6.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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
	public ResponseEntity studyRegisterOk(StudyVO vo,HttpServletRequest request) {
		vo.setIp(request.getRemoteAddr());//접속자 IP
		//글쓴이-session로그인 아이디를 구한다
		vo.setHost_id((String)request.getSession().getAttribute("logId"));
		
		ResponseEntity<String> entity =null;
//		String permission = vo.setPermission((String)request.getSession().getAttribute("logPermission"));
//		if(permission.equals("mentor")) {
//				//멘토
//		}else {
//			service.StudyInsert(vo);	//일반
//		}
		try {
			service.studyInsert(vo);
			//정상구현
			String msg = "<script>";
			msg+="alert('스터디가 등록되었습니다>_<');";
			msg+="location.href='?List';";
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
