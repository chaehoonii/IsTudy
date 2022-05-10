package com.hot6.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.StudyInfoService;
import com.hot6.project.vo.PagingVO;
import com.hot6.project.vo.StudyVO;

@RestController
public class StudyInfoController {
	@Inject
	StudyInfoService service;
	
	// 스터디 정보 페이지
	@GetMapping("/study/study_home") 
	public ModelAndView studyHome(PagingVO vo, String []sclass) {
		if(sclass!=null) {
			for(String str:sclass) {
				System.out.print(str);
			}
		}
		
		
		ModelAndView mav=new ModelAndView(); 
		List<StudyVO> langList=service.langAll(); // 카테고리 언어 출력
		List<StudyVO> studylist= service.studyHome(vo);
		if(studylist!=null) {
			for(StudyVO svo:studylist) {
				List<String> langs=service.studyLang(svo.getStudy_num());
				//System.out.println(svo.getStudy_num()+"/"+langs);
				svo.setLang_list(langs);
			}
			for(StudyVO svo:studylist) {
	        	svo.setTag_list(service.StudyTag(svo.getStudy_num()));
	        }	
		}
		
		mav.addObject("studyhome", studylist); 
		mav.addObject("langList", langList);
		mav.setViewName("/study/studyHome"); 
		return mav; 
	}
	
	@PostMapping("/study/study_home") 
	public List<StudyVO> studyHome2(PagingVO vo) {
	
		List<StudyVO> studylist= service.studyHome(vo);
		if(studylist!=null) {
			for(StudyVO svo:studylist) {
				List<String> langs=service.studyLang(svo.getStudy_num());
				//System.out.println(svo.getStudy_num()+"/"+langs);
				svo.setLang_list(langs);
			}
			for(StudyVO svo:studylist) {
	        	svo.setTag_list(service.StudyTag(svo.getStudy_num()));
	        }	
		}
		
		
		return studylist; 
	}
}
