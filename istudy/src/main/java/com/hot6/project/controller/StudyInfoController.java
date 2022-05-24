package com.hot6.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	public ModelAndView studyHome(String user_nick, PagingVO pvo) {

		ModelAndView mav=new ModelAndView(); 
		
		//검색
		if(user_nick !=null && !user_nick.equals("")) {
			mav.addObject("user_nick", user_nick);
			pvo.setSearchWord(user_nick);
		}
		
		//페이징
		pvo.setOnePageRecord(4);
		pvo.setOnePageCount(5);
		pvo.setTotalRecord(service.totalRecord());
		pvo.setOffsetIndex(pvo.getPageNum(), 4);
		System.out.println(pvo.getOffsetIndex());
		
		List<StudyVO> langList=service.langAll(); // 카테고리 언어 출력
		List<StudyVO> studylist= service.studyHome(pvo);
		if(studylist!=null) {
			for(StudyVO svo:studylist) {
				List<String> langs=service.studyLang(svo.getStudy_num());
				System.out.println(pvo.getStatus()+"<<<<");
				StudyVO studyvo=service.studyPeople(svo.getStudy_num());
				if(studyvo!=null) {
					svo.setIn_people(studyvo.getIn_people());
					svo.setRemain(studyvo.getRemain());
				}
				System.out.println(svo.getStudy_num()+"/"+studyvo);
				svo.setLang_list(langs);
			
				svo.setTag_list(service.StudyTag(svo.getStudy_num()));
			}
		}
		
		String searchUrl = "";
		if(pvo.getStype()!=null) {
			for(String s : pvo.getStype()) {
				searchUrl += "&stype="+s;
			}
		}
		if(pvo.getSclass()!=null) {
			for(String s : pvo.getSclass()) {
				searchUrl += "&sclass="+s;
			}
		}
		if(pvo.getSearchWord()!=null) {
			searchUrl += "&searchWord="+pvo.getSearchWord();
		}
		mav.addObject("searchUrl", searchUrl);
		mav.addObject("pvo", pvo);
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
