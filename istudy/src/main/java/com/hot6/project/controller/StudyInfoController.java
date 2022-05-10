package com.hot6.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.StudyInfoService;
import com.hot6.project.vo.PagingVO;
import com.hot6.project.vo.StudyInfoVO;

@Controller
public class StudyInfoController {
	@Inject
	StudyInfoService service;
	
	// 스터디 정보 페이지
	@GetMapping("/study/study_home") 
	public ModelAndView studyHome(PagingVO vo) {
		ModelAndView mav=new ModelAndView(); 
		List<StudyInfoVO> langList=service.langAll(); // 카테고리 언어 출력
		List<StudyInfoVO> list= service.studyHome(vo);
		if(list!=null) {
			for(StudyInfoVO svo:list) {
				List<String> langs=service.studyLang(svo.getStudy_num());
				System.out.println(svo.getStudy_num()+"/"+langs);
				svo.setLang_type_name_list(langs);
			}
		}
		mav.addObject("studyhome", list); 
		mav.addObject("langList", langList);
		mav.setViewName("/study/studyHome"); 
		return mav; 
	}
}
