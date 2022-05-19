package com.hot6.project.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.StudyDetailService;

@RestController
public class StudyDetailController{
	@Inject
	StudyDetailService service;
	
	// 스터디 상세 페이지
	@GetMapping("/study/study_home/{study_num}")
	public ModelAndView studyInfo(@PathVariable int study_num) {
		ModelAndView mav=new ModelAndView();
		//스터디 상세 페이지
		mav.addObject("studydetail", service.studydetail(study_num));
		mav.addObject("studyuser", service.studyuser(study_num));
		mav.setViewName("/study/studyDetail");
		return mav;
	}
}
