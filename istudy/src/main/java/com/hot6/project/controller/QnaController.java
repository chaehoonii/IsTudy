package com.hot6.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.QnaService;
import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.StudyVO;

@Controller
public class QnaController {
	@Inject 
	QnaService Qservice;
	
	//메인페이지
		@RequestMapping(value = "/qna/qnaList", method = RequestMethod.GET)
	    public ModelAndView home(HttpSession session) {
	        ModelAndView mav = new ModelAndView();
	        //총 질문 수
	        mav.addObject("totalQna", Qservice.TotalQna());
	        //질문 리스트
	        List<BoardVO> qnalist = Qservice.QnaList();
	        for(BoardVO vo:qnalist) {
	        	vo.setLang_list(Qservice.QnaLangType(vo.getBoard_num()));
	        	System.out.println(vo.getLang_list());
	        }
	        for(BoardVO vo:qnalist) {
	        	vo.setTag_list(Qservice.QnaTag(vo.getBoard_num()));
	        }	
	        mav.addObject("qnaList", qnalist);
	        mav.setViewName("/qna/qnaList");
	        return mav;
	    }
	

}
