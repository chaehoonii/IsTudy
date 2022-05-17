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
	
	@GetMapping("adminUsers")
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
		
		mav.setViewName("admin/adminUsers");
		
		return mav;
	}
	
	@GetMapping("adminReport")
	public ModelAndView adminReport(HttpSession session) {
		
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
		
		mav.setViewName("admin/adminReport");
		
		return mav;
	}
	
//	@GetMapping("adminReport")
//	public ModelAndView adminReport(HttpSession session) {
//		
//		ModelAndView mav = new ModelAndView();
//		
//		mav.addObject("report_type_num", AUservice.getReport_type_num());
//		mav.addObject("user_id", AUservice.getUser_id());
//		mav.addObject("report_content", AUservice.getReport_content());
//		mav.addObject("report_time", AUservice.getReport_time());
//		mav.addObject("report_writing", AUservice.getReport_writing());
//		mav.addObject("writer", AUservice.getWriter());
//		mav.addObject("process_status", AUservice.getProcess_status());
//		
//		mav.setViewName("admin/adminReport");
//		
//		return mav;
//	}
	

}