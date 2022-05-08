package com.hot6.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.StudyService;

@Controller
@RequestMapping("/users/")
public class MypageController {
	
	@Inject 
	StudyService Sservice;
	
	
	//마이페이지(진행 스터디)로 이동
		@GetMapping("mypage/study")
		public ModelAndView joinStudy(HttpSession session) {
			
			ModelAndView mav = new ModelAndView();
			
			String id = (String)session.getAttribute("logId");
			
			mav.addObject("Jstudy", Sservice.joinStudy(id));
			
			mav.addObject("Fstudy", Sservice.finishStudy(id));
			
			
			mav.setViewName("users/mypage/study");
			return mav;
			
		}
		
		//마이페이지(글관리)로 이동
		@GetMapping("mypage/viewWrite")
		public ModelAndView viewWrite() {
					
			ModelAndView mav = new ModelAndView();
			mav.setViewName("users/mypage/viewWrite");
			return mav;
					
		}

}