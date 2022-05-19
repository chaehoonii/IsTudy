package com.hot6.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.MypageService;
import com.hot6.project.service.UserService;
import com.hot6.project.vo.UserVO;



@Controller
@RequestMapping("/users/")
public class MypageController {
	
	@Inject 
	MypageService Mservice;
	
	@Inject
	UserService Uservice;
	
	//마이페이지(진행 스터디)로 이동
	@GetMapping("mypage/study")
	public ModelAndView joinStudy(@RequestParam(name = "type",defaultValue = "all") String type, String user_id, String admin, HttpSession session) {
			
		ModelAndView mav = new ModelAndView();
		
		String id;
		
		if(admin==null || !admin.equals("True")) {
			
			id = (String)session.getAttribute("logId");
		}else {
			id= user_id;
		}
		
		UserVO userVO =Uservice.userSelect(id);
		session.setAttribute("logImg", userVO.getProfile_img());

			
		if(type.equals("like")) {
			//찜한 스터디
			mav.addObject("study", Mservice.getLikeStudy(id));
			
			mav.addObject("cnt_study", Mservice.cntLikeStudy(id));
			
		}else if(type.equals("end")) {
			//완료 스터디
			mav.addObject("study", Mservice.finishStudy(id));
			
			mav.addObject("cnt_study", Mservice.cntFinishStudy(id));		
			
		}else {
			//진행 스터디
			mav.addObject("study", Mservice.joinStudy(id));

			mav.addObject("cnt_study", Mservice.cntJoinStudy(id));			
		}

		mav.addObject("id", id);
		mav.addObject("level_icon", Mservice.getIcon(id));
		mav.addObject("nickName", Mservice.getNickname(id));
			
		mav.setViewName("users/mypage/study");
		
		return mav;
			
	}

		
	//마이페이지(글관리)로 이동
	@GetMapping("mypage/viewWrite")
	public ModelAndView viewWrite(String user_id, String admin, HttpSession session) {
					
		ModelAndView mav = new ModelAndView();
			
		String id;
		
		if(admin==null || !admin.equals("True")) {			
			id = (String)session.getAttribute("logId");
		}else {
			//관리자가 회원 마이페이지 접근하려는 경우
			id= user_id;
		}			
		mav.addObject("article", Mservice.getArticles(id));
		
		mav.addObject("cntArticle", Mservice.cntArticle(id));
		
		mav.addObject("id", id);
		
		mav.addObject("nickName", Mservice.getNickname(id));
		
		mav.setViewName("users/mypage/viewWrite");
		return mav;
					
	}
	
	//마이페이지(댓글 단글)로 이동
		@GetMapping("mypage/viewComment")
		public ModelAndView viewComment(String user_id, String admin, HttpSession session) {
						
			ModelAndView mav = new ModelAndView();
				
			String id;
			
			if(admin==null || !admin.equals("True")) {			
				//관리자가 아닐 경우
				id = (String)session.getAttribute("logId");
			}else {
				//관리자가 회원 마이페이지 접근하려는 경우
				id= user_id; 
			}

			mav.addObject("comment", Mservice.getComments(id));
			
			mav.addObject("cntComment", Mservice.cntComment(id));
			
			mav.addObject("id", id);
			
			mav.addObject("nickName", Mservice.getNickname(id));
			
			mav.setViewName("users/mypage/viewComment");
			return mav;
						
		}
	
	
}
