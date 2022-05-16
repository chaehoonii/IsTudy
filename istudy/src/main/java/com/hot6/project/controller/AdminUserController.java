package com.hot6.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.AdminUserService;
import com.hot6.project.vo.PagingVO;
import com.hot6.project.vo.UserVO;

@Controller
@RequestMapping("/admin/")
public class AdminUserController {
	
	@Inject
	AdminUserService AUservice;
	
	@GetMapping("adminUsers")
	public ModelAndView adminUser(@RequestParam(name = "permission",defaultValue = "all") String permission, String want,  PagingVO pvo, HttpSession session) {
		
		
		System.out.println(permission);
		
		System.out.println(want);
		
		ModelAndView mav = new ModelAndView();
		
		String id = (String)session.getAttribute("logId");
		
		String nickName = (String)session.getAttribute("logNickname");
		
		mav.addObject("id", id);
		
		mav.addObject("nickName", nickName);
	
		int allCnt = AUservice.getAllCnt(permission,want);
		System.out.println(allCnt);
		pvo.setTotalRecord(allCnt);
			
		if(permission.equals("all")) { //전체 회원
			mav.addObject("users", AUservice.getUserInfo(pvo));
		}else if(want==null){ //일반 회원, 멘토 회원
			mav.addObject("users", AUservice.userPermission(permission,pvo));
		}else { //일반회원인데 멘토 신청 회원
			mav.addObject("users", AUservice.userWant(permission, want,pvo));
		}
		
		//해당 회원 수
		mav.addObject("allCnt",allCnt );
		//일반 회원수
		mav.addObject("userCnt", AUservice.getUserCnt());
		//멘토 회원수
		mav.addObject("mentorCnt", AUservice.getMentorCnt());
		//관리자 수
		mav.addObject("adminCnt", AUservice.getAdminCnt());
		
		mav.addObject("pvo", pvo);
		
		mav.setViewName("admin/adminUsers");
		
		return mav;
	}
	
	//멘토 신청 승인
	@PostMapping("approveUser")
	public ModelAndView approveUser(UserVO vo) {
		
		ModelAndView mav = new ModelAndView();
		
		AUservice.approveUserStatus(vo);
		
		mav.setViewName("redirect:AdminUsers");
		
		return mav;
		
	}
	
	//멘토 신청 반려
	@PostMapping("sendBackUser")
	public ModelAndView sendBackUser(UserVO vo) {
		
		ModelAndView mav = new ModelAndView();
		
		AUservice.sendBackStatus(vo);
		
		mav.setViewName("redirect:AdminUsers");
		
		return mav;
	}

}
