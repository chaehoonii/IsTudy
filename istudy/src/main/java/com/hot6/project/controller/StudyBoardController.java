package com.hot6.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.BoardService;
import com.hot6.project.service.StudyBoardService;
import com.hot6.project.service.StudyService;
import com.hot6.project.vo.BoardVO;

@Controller
@RequestMapping("/study/")
public class StudyBoardController {
	@Inject
	StudyBoardService SBservice;
	
	@Inject
	BoardService Bservice;
	
	@Inject
	StudyService Sservice;
	
	@GetMapping("studyBoard/studyBoardList")
    public ModelAndView studyBoardList(HttpSession session, int study_num) {
        ModelAndView mav = new ModelAndView();
        //게시판 글 총 갯수
        mav.addObject("totalstudyBoard", SBservice.TotalStudyBoardList(study_num));
        //글 리스트
        List<BoardVO> studyboardlist = SBservice.StudyBoardList(study_num);
	
        mav.addObject("studyBoardList", studyboardlist);
        mav.setViewName("/studyBoard/studyBoardList");
        return mav;
    }
	
	
	
}
