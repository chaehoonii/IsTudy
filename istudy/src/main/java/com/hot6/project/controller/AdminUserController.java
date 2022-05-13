package com.hot6.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.AdminUserService;

@Controller
@RequestMapping("/admin/")
public class AdminUserController {
	
	@Inject
	AdminUserService AUservice;
	
	@GetMapping("users")
	public ModelAndView adminUser(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		String id = (String)session.getAttribute("logId");
		
		String nickName = (String)session.getAttribute("logNickname");
		
		mav.addObject("id", id);
		
		mav.addObject("nickName", nickName);
		
		mav.addObject("users", AUservice.getUserInfo());
		
		mav.addObject("allCnt", AUservice.getAllCnt());
		mav.addObject("userCnt", AUservice.getUserCnt());
		mav.addObject("mentorCnt", AUservice.getMentorCnt());
		mav.addObject("adminCnt", AUservice.getAdminCnt());
		
		mav.setViewName("admin/users");
		
		return mav;
	}

}
