package com.hot6.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.StudyRegisterService;
import com.hot6.project.vo.StudyRegisterVO;

@RestController
@RequestMapping("/studyregister/")
public class StudyRegisterController {
	@Inject 
	StudyRegisterService service; //inject : 객체를 만들어 반환
		
	//스터디 폼
	@GetMapping("studyregister_0")
	public ModelAndView studyRegisterWrite0() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("studyregister/studyregister_0");
		return mav;
	}
	//스터디 폼
	@GetMapping("studyregister_1")
	public ModelAndView studyRegisterWrite1() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("studyregister/studyregister_1");
		return mav;
	}
	@GetMapping("studyregister_2")
	public ModelAndView studyRegisterWrite2() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("studyregister/studyregister_2");
		return mav;
	}
	@GetMapping("studyregister_3")
	public ModelAndView studyRegisterWrite3() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("studyregister/studyregister_3");
		return mav;
	}
	@GetMapping("studyregister_4")
	public ModelAndView studyRegisterWrite4() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("studyregister/studyregister_4");
		return mav;
	}
	//스터디 등록
	@PostMapping("studyRegisterOk")
	public ResponseEntity studyRegisterOk(StudyRegisterVO vo,HttpServletRequest request) {
		vo.setIp(request.getRemoteAddr());//접속자 IP
		//글쓴이-session로그인 아이디를 구한다
		vo.setUserid((String)request.getSession().getAttribute("logId"));
		
		ResponseEntity<String> entity =null;
		
		try {
			service.StudyInsert(vo);
			//정상구현
			String msg = "<script>";
			msg+="alert('스터디가 등록되었습니다>_<');";
			msg+="location.href='boardList';";
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
