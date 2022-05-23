package com.hot6.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.BoardService;
import com.hot6.project.service.StudyBoardService;
import com.hot6.project.service.StudyService;
import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.PagingVO;

@Controller
@RequestMapping("/study/")
public class StudyBoardController {
	@Inject
	StudyBoardService SBservice;
	
	@Inject
	BoardService Bservice;
	
	@Inject
	StudyService Sservice;
	
	@RequestMapping(value = "/studyboard/studyboardList", method = RequestMethod.GET)
    public ModelAndView home(HttpSession session, PagingVO pvo) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/study/studyboard/studyboardList");
        return mav;
    }
	//글 상세
	@GetMapping("studyboard/studyboardView")
	public ModelAndView studyboardView(int board_num) {
		ModelAndView mav = new ModelAndView();
		BoardVO vo = SBservice.StudyBoardView(board_num);
    	Bservice.hitUp(board_num);
    	mav.addObject("vo", vo);
		mav.setViewName("/study/studyboard/studyboardView");
		return mav;
	}
	//좋아요 누르기
	@ResponseBody // Ajax
	@RequestMapping(value = "studyboard/likeUp", method = RequestMethod.POST)
	public int likeUp(@RequestParam("reply_num") int reply_num, HttpSession session) {
		String user_id = (String)session.getAttribute("logId");
		int Chk = SBservice.LikeUp(user_id, reply_num);
		if(Chk>0) {
			String your_id = Bservice.getIdByReplynum(reply_num); //댓글작성자
			Bservice.expUpLike(your_id);
		}
		return Chk;
	}
	//좋아요 취소
	@ResponseBody // Ajax
	@RequestMapping(value = "studyboard/likeDown", method = RequestMethod.GET)
	public int likeDown(@RequestParam("reply_num") int reply_num, HttpSession session) {
		String user_id = (String)session.getAttribute("logId");
		int Chk = SBservice.LikeDown(user_id, reply_num);
		if(Chk>0) {
			String your_id = Bservice.getIdByReplynum(reply_num); //댓글작성자
			Bservice.expDownLike(your_id);
		}
		return Chk;
	}
	//글 등록 폼
	@RequestMapping(value = "studyboard/studyboardWrite", method = RequestMethod.GET)
	public ModelAndView studyboardWrite(int study_num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("study_num", study_num);
		mav.setViewName("/study/studyboard/studyboardWrite");
		System.out.println(study_num);
		return mav;
	}
	//글 수정 폼
	@RequestMapping(value = "studyboard/studyboardEdit", method = RequestMethod.GET)
	public ModelAndView studyboardEdit(int board_num) {
		ModelAndView mav = new ModelAndView();
		BoardVO vo = SBservice.StudyBoardView(board_num);
	    mav.addObject("vo", vo);
		return mav;
	}
	
}
