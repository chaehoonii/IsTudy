package com.hot6.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		List<StudyVO> studyuser = service.studyuser(study_num);
		mav.addObject("studyuser", service.studyuser(study_num));
		mav.addObject("study_num", study_num); //숫자 하나만
		mav.setViewName("/study/studyDetail");
		return mav;
	}
	//좋아요 누르기
	@ResponseBody // Ajax
	@RequestMapping(value = "/study/likeUp", method = RequestMethod.POST)
	public int likeUp(@RequestParam("study_num") int study_num, HttpSession session) {
		String user_id = (String)session.getAttribute("logId");
		int Chk = service.LikeUp(user_id, study_num);
		System.out.print(study_num);
		return Chk;
	}
	//좋아요 취소
	@ResponseBody // Ajax
	@RequestMapping(value = "/study/likeDown", method = RequestMethod.GET)
	public int likeDown(@RequestParam("study_num") int study_num, HttpSession session) {
		String user_id = (String)session.getAttribute("logId");
		int Chk = service.LikeDown(user_id, study_num);
		return Chk;
	}
	@ResponseBody // Ajax
	@RequestMapping(value = "/study/likeDetail", method = RequestMethod.GET)
	public StudyVO likeDetail(@RequestParam("study_num") int study_num, HttpSession session) {
		String user_id = (String)session.getAttribute("logId");
		return service.LikeDetail(user_id, study_num);
	}
}
