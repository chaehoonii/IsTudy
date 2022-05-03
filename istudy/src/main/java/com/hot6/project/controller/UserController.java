package com.hot6.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.UserService;
import com.hot6.project.vo.UserVO;

@Controller
@RequestMapping("/users/")
public class UserController {
	
	@Inject
	UserService service;
	
	//로그인 페이지 이동
	@GetMapping("login")
	public ModelAndView login() {
		
		ModelAndView mav = new ModelAndView();	
		mav.setViewName("users/login");	
		return mav;
	}
	
	//로그인
	@PostMapping("loginOk")
	public ResponseEntity<String> loginOk(UserVO vo, HttpSession session) {
		
		ResponseEntity<String> entity = null;
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html;charset=utf-8");
		
		try {
			UserVO user = service.loginCheck(vo);
			
			if(user!=null) {
				session.setAttribute("logId", user.getUser_id());
				session.setAttribute("logNickname", user.getUser_nick());
				session.setAttribute("logName", user.getUser_name());
				session.setAttribute("logStatus", "Y");
				
				String msg = "<script>alert('로그인 성공하였습니다.');location.href = '/';</script>";
				entity = new ResponseEntity<String>(msg,headers,HttpStatus.OK);
				
			}else {
				throw new Exception();
			}
			
		}catch(Exception e){
			e.printStackTrace();
			
			String msg = "<script>alert('로그인 실패하였습니다.\\n 다시 로그인하세요.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	//아이디 찾기 페이지 이동
	@GetMapping("idSearch")
	public ModelAndView idSearch() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("users/idSearch");
		return mav;
	}
	
	//아이디 찾기
	
	
	//비밀번호 찾기 페이지 이동
	@GetMapping("pwdSearch")
	public ModelAndView pwdSearch() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("users/pwdSearch");
		return mav;
	}

}
