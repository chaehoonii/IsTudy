package com.hot6.project;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.JobService;
import com.hot6.project.service.StudyService;
import com.hot6.project.service.UserService;
import com.hot6.project.vo.StudyVO;

@Controller
public class HomeController {
	@Inject
	UserService Uservice;
	@Inject
	JobService Jservice;
	@Inject
	StudyService Sservice;
	
	//메인페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        //멘토 추천
        mav.addObject("MentorList", Uservice.MentorRecommend());
        //채용정보
        mav.addObject("JobList", Jservice.JobRecommend());
        //스터디 추천
        String user_id = (String)session.getAttribute("logId");
        System.out.println(user_id);
        System.out.println((String)session.getAttribute("logPermission"));
        List<StudyVO> studylist = Sservice.StudyRecommend(user_id);
        for(StudyVO vo:studylist) {
        	vo.setLang_list(Sservice.StudyLangType(vo.getStudy_num()));
        } 
        for(StudyVO vo:studylist) {
        	vo.setTag_list(Sservice.StudyTag(vo.getStudy_num()));
        }	
        
        mav.addObject("StudyList", studylist);
        mav.setViewName("home");
        return mav;
    }
	
	
}