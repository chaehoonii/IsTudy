package com.hot6.project;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.UserService;

@Controller
public class HomeController {
	@Inject
	UserService Uservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("MentorList", Uservice.MentorRecommend());
        mav.setViewName("home");
        return mav;
    }
}