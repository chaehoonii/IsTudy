package com.hot6.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public ModelAndView studyHome(PagingVO vo) {
		/*
		 * if(sclass!=null) { for(String str:sclass) { System.out.print(str); } }
		 */
		
		ModelAndView mav=new ModelAndView(); 
		
		vo.setTotalRecord(service.totalRecord(vo));
		
		List<StudyVO> langList=service.langAll(); // 카테고리 언어 출력
		List<StudyVO> studylist= service.studyHome(vo);
		if(studylist!=null) {
			for(StudyVO svo:studylist) {
				List<String> langs=service.studyLang(svo.getStudy_num());
				System.out.println(vo.getStatus()+"<<<<");
				StudyVO pvo=service.studyPeople(svo.getStudy_num());
				if(pvo!=null) {
					svo.setIn_people(pvo.getIn_people());
					svo.setRemain(pvo.getRemain());
				}
				System.out.println(svo.getStudy_num()+"/"+pvo);
				svo.setLang_list(langs);
			
				svo.setTag_list(service.StudyTag(svo.getStudy_num()));
			}
			
		}
		
		mav.addObject("studyhome", studylist); 
		mav.addObject("langList", langList);
		mav.setViewName("/study/studyHome"); 
		return mav; 
	}
	
	@PostMapping("/study/study_home2")
	public List<StudyVO> studyHome2(PagingVO vo) {
		System.out.println(vo.getSclass());
	
		List<StudyVO> studylist= service.studyHome(vo);
		if(studylist!=null) {
			for(StudyVO svo:studylist) {
				List<String> langs=service.studyLang(svo.getStudy_num());
				System.out.println(svo.getStudy_name()+"/"+langs);
				svo.setLang_list(langs);
				svo.setTag_list(service.StudyTag(svo.getStudy_num()));
				StudyVO pvo=service.studyPeople(svo.getStudy_num());
				if(pvo!=null) {
					svo.setIn_people(pvo.getIn_people());
					svo.setRemain(pvo.getRemain());
				}
			}
		}
		return studylist; 
	}
}
