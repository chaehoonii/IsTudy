package com.hot6.project.service;

import java.util.List;

import com.hot6.project.vo.UserVO;

public interface UserService {
	public List<UserVO> MentorRecommend();
	
	//로그인
	public UserVO loginCheck(UserVO vo);
	
	//아이디 찾기
	public String findId(UserVO vo);
	
	//아이디, 이메일 일치하는 회원 있는지 확인
	public int matchUser(UserVO vo);
	
	//임의로 생성한 비밀번호로 업데이트
	public int pwdUpdate(String newPwd, UserVO vo);
}
