package com.hot6.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.MypageService;
import com.hot6.project.service.UserService;
import com.hot6.project.vo.UserVO;



@Controller
@RequestMapping("/users/")
public class MypageController {
	
	@Inject 
	MypageService Mservice;
	
	@Inject
	UserService Uservice;
	
	//마이페이지(진행 스터디)로 이동
	@GetMapping("mypage/study")
	public ModelAndView joinStudy(HttpSession session) {
			
		ModelAndView mav = new ModelAndView();
			
		String id = (String)session.getAttribute("logId");
		String nickName = (String)session.getAttribute("logNickname");
		UserVO userVO =Uservice.userSelect(id);
		session.setAttribute("logImg", userVO.getProfile_img());
			
		mav.addObject("Jstudy", Mservice.joinStudy(id));
			
		mav.addObject("Fstudy", Mservice.finishStudy(id));
		
		mav.addObject("cntJstudy", Mservice.cntJoinStudy(id));
		
		mav.addObject("cntFstudy", Mservice.cntFinishStudy(id));
		
		mav.addObject("id", id);
		
		mav.addObject("nickName", nickName);
			
		mav.setViewName("users/mypage/study");
		
		return mav;
			
	}

		
	//마이페이지(글관리)로 이동
	@GetMapping("mypage/viewWrite")
	public ModelAndView viewWrite(HttpSession session) {
					
		ModelAndView mav = new ModelAndView();
			
		String id = (String)session.getAttribute("logId");
		
		String nickName = (String)session.getAttribute("logNickname");
			
		mav.addObject("article", Mservice.getArticles(id));
		
		mav.addObject("comment", Mservice.getComments(id));
		
		mav.addObject("cntArticle", Mservice.cntArticle(id));
		
		mav.addObject("cntComment", Mservice.cntComment(id));
		
		mav.addObject("id", id);
		
		mav.addObject("nickName", nickName);
		
		mav.setViewName("users/mypage/viewWrite");
		return mav;
					
	}
	
}
