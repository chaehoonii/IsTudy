package com.hot6.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.StudyDetailService;
import com.hot6.project.service.StudyInfoService;
import com.hot6.project.vo.StudyVO;

@RestController
public class StudyDetailController{
	@Inject
	StudyDetailService service;
	@Inject
	StudyInfoService service2;
	
	// 스터디 상세 페이지
	@GetMapping("/study/study_home/{study_num}")
	public ModelAndView studyInfo(@PathVariable int study_num) {
		ModelAndView mav=new ModelAndView();
		StudyVO vo= service.studydetail(study_num);
		List<String> langs=service2.studyLang(study_num);
			StudyVO pvo=service2.studyPeople(study_num);
				if(pvo!=null) {
					vo.setIn_people(pvo.getIn_people());
					vo.setRemain(pvo.getRemain());
					vo.setMax(pvo.getMax());
				}
				System.out.println(study_num+"/"+pvo);
				vo.setLang_list(langs);
				vo.setTag_list(service2.StudyTag(study_num));
			
		//스터디 상세 페이지
		mav.addObject("vo",vo);
		/*28, 40줄 mav.addObject("studydetail", service.studydetail(study_num)); */
		mav.addObject("studyuser", service.studyuser(study_num));
		mav.setViewName("/study/studyDetail");
		return mav;
	}
}
