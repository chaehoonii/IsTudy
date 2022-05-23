package com.hot6.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.CalendarService;
import com.hot6.project.service.NoticeService;
import com.hot6.project.service.StudyBoardService;
import com.hot6.project.service.StudyDetailService;
import com.hot6.project.service.StudyRoomService;
import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.PagingVO;
import com.hot6.project.vo.StudyVO;

@RestController
public class StudyRoomController {
	@Inject
	StudyRoomService service;
	@Inject
	CalendarService Cservice;
	@Inject
	StudyDetailService SDservice;
	@Inject
	StudyBoardService SBservice;
	@Inject
	NoticeService Nservice;
	
	ModelAndView mav = new ModelAndView();
	
	@RequestMapping(value = "/study/studyRoom", method = RequestMethod.GET)
    public ModelAndView studyRoom(int study_num, PagingVO pvo) {
		mav.addObject("study_num", study_num);
		mav.addObject("vo", SDservice.studyRoom(study_num));
		mav.addObject("mateList", SDservice.mateList(study_num));
		mav.setViewName("/study/studyRoom");
		mav.addObject("total_study_board", SBservice.TotalStudyBoardList(study_num));
        //게시판 리스트
        List<BoardVO> studyboardlist = SBservice.StudyBoardList(study_num, pvo);
        mav.addObject("studyboardList", studyboardlist);
        mav.addObject("study_num", study_num);
        pvo.setTotalRecord(Nservice.setTotalRecord(3));
        mav.addObject("pvo", pvo);
		return mav;
	}
}
