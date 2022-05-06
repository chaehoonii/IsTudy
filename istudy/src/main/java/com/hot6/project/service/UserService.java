package com.hot6.project.service;

import java.util.List;

import com.hot6.project.vo.UserVO;

public interface UserService {

	public int userInsert(UserVO vo, String filePath);

	// 아이디 중복 체크
	public int idCheck(String id);

	// 회원정보수정 폼 진입>로그인 정보 가져오기 (user 1명 선택)
	public UserVO userSelect(String id);

	// 회원정보 수정 - userEdit>userEditOk
	public int userUpdate(UserVO vo, String filePath);

	// 프로필 불러다 보기 (userView)
	public UserVO userView(String id);

	// 회원탈퇴
	public int userDelete(String id);

	public List<UserVO> MentorRecommend();
	
	//로그인
	public UserVO loginCheck(UserVO vo);
	public UserVO inquiryOfUserById(String id);

	//아이디 찾기
	public String findId(UserVO vo);
	
	//아이디, 이메일 일치하는 회원 있는지 확인
	public int matchUser(UserVO vo);
	
	//임의로 생성한 비밀번호로 업데이트
	public int pwdUpdate(String newPwd, UserVO vo);
}