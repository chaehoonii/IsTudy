package com.hot6.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.AdminDataService;
import com.hot6.project.service.AdminUserService;
import com.hot6.project.service.UserService;
import com.hot6.project.vo.StudyVO;
import com.hot6.project.vo.UserVO;

@Controller
@RequestMapping("/admin/")
public class AdminDataController {
	
	@Inject
	AdminDataService ADservice;
	
	@Inject
	AdminUserService AUservice;

	@Inject
	UserService Uservice;
	
	@GetMapping("adminData")
	public ModelAndView adminData(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		String id = (String)session.getAttribute("logId");
		
		String nickName = (String)session.getAttribute("logNickname");
		
		UserVO userVO =Uservice.userSelect(id);
		session.setAttribute("logImg", userVO.getProfile_img());
		
		
		//1.신규 회원
		String date_str = "";
		String new_num = "";
		
		List<UserVO> member_list = ADservice.get_new_member();
		
		if(member_list!=null) {
			int j=0;
			for(UserVO uvo:member_list) {
				if(j==member_list.size()-1) {
					date_str+="\'"+ uvo.getRegister_date()+"\'";
					new_num+=" " + uvo.getCnt();
				}else {
					date_str+="\'"+ uvo.getRegister_date()+"\',";
					new_num+=" "+uvo.getCnt()+",";
				}
				j++;
			}	
		}
		
		//가입일
		mav.addObject("register_date",date_str);
				
		//해당 일의 신규 회원 수
		mav.addObject("new_cnt", new_num);
		
		
		//2. 스터디 분포
		//프펀트 엔드, 백엔드, 알고리즘, 프로젝트 ,영어, 그외
		mav.addObject("frontend", ADservice.get_study_cnt(1));		
		mav.addObject("backend", ADservice.get_study_cnt(2));
		mav.addObject("algo", ADservice.get_study_cnt(3));
		mav.addObject("project", ADservice.get_study_cnt(4));
		mav.addObject("english", ADservice.get_study_cnt(5));
		mav.addObject("etc", ADservice.get_study_cnt(6));		
		
		
		//3 멘토 회원, 일반 회원
		//일반 회원수
		mav.addObject("user", AUservice.getPermissionCnt("user", null));
		//멘토 회원수
		mav.addObject("mentor", AUservice.getPermissionCnt("mentor", null));
		
		
		//인기 있는 스터디 (찜한 스터디 순위)
		List<StudyVO> study_list= ADservice.get_popular_study();
		
		String study_str="";
		String study_num = "";
		
		if(study_list!=null) {
			int i=0;
			for(StudyVO svo:study_list) {
				if(i==study_list.size()-1) {
					study_str+="\'"+svo.getStudy_name()+"\'";
					study_num+=" " + svo.getCnt();
				}else {
					study_str+="\'"+svo.getStudy_name()+"\',";
					study_num+=" "+svo.getCnt()+",";
				}
				i++;
			}
		}
		
		//스터디 이름
		mav.addObject("study_rank",study_str);
		
		//스터디 개수
		mav.addObject("study_rank_cnt", study_num);
			
		mav.addObject("id", id);
		
		mav.addObject("nickName", nickName);
		
		mav.setViewName("admin/adminData");
				
		return mav;
	}
}