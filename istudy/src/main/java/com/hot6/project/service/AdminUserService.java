package com.hot6.project.service;

import java.util.List;

import com.hot6.project.vo.UserVO;

public interface AdminUserService {
	
	//전체 회원 정보 가져오기
	public List<UserVO> getUserInfo();
	
	//전체 회원 수
	public int getAllCnt();
	
	//일반 회원 수
	public int getUserCnt();
	
	//멘토 회원 수
	public int getMentorCnt();
	
	//관리자 수
    public int getAdminCnt();
    
    //신고 분류
//  	public int getReport_type_num();
//
//  	//신고자
//  	public String getUser_id();
//  	
//  	//신고 내용
//  	public String getReport_content();
//  	
//  	//신고일
//  	public String getReport_time();
//  	
//  	//신고글
//  	public String getReport_writing();
//  	
//  	//작성자
//  	public String getWriter();
//  	
//  	//처리상태
//  	public String getProcess_status();
   
}