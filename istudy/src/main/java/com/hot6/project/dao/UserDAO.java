package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.UserVO;

@Mapper
@Repository
public interface UserDAO {
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
