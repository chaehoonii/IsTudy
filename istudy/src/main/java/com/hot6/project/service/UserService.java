package com.hot6.project.service;

import java.util.List;

import com.hot6.project.vo.UserVO;

public interface UserService {
	public List<UserVO> MentorRecommend();
	
	//·Î±×ÀÎ 
	public UserVO loginCheck(UserVO vo);
}
