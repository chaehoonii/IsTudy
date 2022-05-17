package com.hot6.project.controller;

import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.StudyService;
import com.hot6.project.service.UserService;
import com.hot6.project.vo.StudyVO;

@Controller
public class StudyRoomController {
	@Inject
	StudyService Sservice;
	@Inject
	UserService Uservice;
	
		//화면공유
		@RequestMapping(value = "/study/webSocket/screenShare", method = RequestMethod.GET)
		public String screenShare() {
			return "/study/webSocket/screenShare";
		}
		
		//목소리 공유
		@RequestMapping(value="/study/webSocket/audio", method = RequestMethod.GET) 
	    public String audio() {
	    	return "/study/webSocket/audio";
	    }
		
	    //화이트보드
	    @RequestMapping(value="/study/webSocket/canvas", method = RequestMethod.GET)
	    public String canvas() {
	    	return "/study/webSocket/canvas";
	    }
	    
	    //채팅
	    @RequestMapping(value="/study/webSocket/chatPage", method = RequestMethod.GET)
	    public String chatPage() {
	    	return "/study/webSocket/chatPage";
	    }
	    @RequestMapping(value="/study/webSocket/studyBottom", method = RequestMethod.GET)
	    public String studyBottom() {
	    	return "/study/webSocket/studyBottom";
	    }
	    @RequestMapping(value="/study/webSocket/studyPageChat", method = RequestMethod.GET)
	    public String studyPageChat() {
	    	return "/study/webSocket/studyPageChat";
	    }
	    @RequestMapping(value="/study/webSocket/studyPageMatesList", method = RequestMethod.GET)
	    public String studyPageMatesList() {
	    	return "/study/webSocket/studyPageMatesList";
	    }
	    @RequestMapping(value="/study/webSocket/studySidebar", method = RequestMethod.GET)
	    public String studySidebar() {
	    	return "/study/webSocket/studySidebar";
	    }
	    @RequestMapping(value="/compiler", method = RequestMethod.GET)
	    public String compiler(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
	    	request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
	    	return "/study/webSocket/compiler";
	    }
	    //스터디페이지 - 멘토
	    @RequestMapping(value="/study/webSocket/studyPage", method = RequestMethod.GET)
	    public ModelAndView studyPage(@RequestParam("study_num") int study_num, HttpSession session, HttpServletRequest request) {
	    	ModelAndView mav = new ModelAndView();
	    	StudyVO vo = Sservice.getStudyByStudynum(study_num);
	    	String logId = (String) session.getAttribute("logId");
	    	session.setAttribute("my_id", "user"+Integer.toString((int)(Math.random() * 10000)));	    	
			vo.setUser_nick(Uservice.selectNickById(logId));
			
	    	//그룹에 참여한 멘티 목록
	    	List<StudyVO> studymates = Sservice.StudyMates(study_num);
	    	//자신이 개설 or 가입한 스터디 페이지에만 접근
	    	for(StudyVO mate : studymates) {
	    		System.out.println("mate:"+mate.getUser_id());
	    		if((mate.getUser_id()).equals(logId) || logId.equals(vo.getHost_id())){
	    			mav.addObject("vo", vo);
			    	mav.addObject("nick", vo.getUser_nick());
			    	mav.setViewName("/study/webSocket/studyPage");
			    	System.out.println("yes");
			    	break;
	    		}else {
		    		mav.setViewName("home");
		    		System.out.println("no");
	    		}
	    	}
	    	return mav;
	    }
}
