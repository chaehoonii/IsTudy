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

}
