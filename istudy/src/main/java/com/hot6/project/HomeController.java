package com.hot6.project;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.JobService;
import com.hot6.project.service.UserService;

@Controller
public class HomeController {
	@Inject
	UserService Uservice;
	@Inject
	JobService Jservice;
	
	//메인페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView mav = new ModelAndView();
        //멘토 추천
        mav.addObject("MentorList", Uservice.MentorRecommend());
        //채용정보
        mav.addObject("JobList", Jservice.JobRecommend());
        //스터디 추천
        
        mav.setViewName("home");
        return mav;
    }
	
	
}