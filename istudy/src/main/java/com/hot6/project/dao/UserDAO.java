package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.UserVO;

@Mapper
@Repository
public interface UserDAO {

	public int userInsert(UserVO vo, String filePath);

	// 아이디 중복 체크
	public int idCheck(String id);

	// 로그인 (임시)
	public UserVO loginCheck(UserVO vo);
	public UserVO inquiryOfUserById(String id);

	// 회원정보수정 폼 진입>로그인 정보 가져오기 (user 1명 선택)
	public UserVO userSelect(String id);

	// 회원정보 수정 - userEdit>userEditOk
	public int userUpdate(UserVO vo, String filePath);

	// 프로필 불러다 보기 (userView)
	public UserVO userView(String id);

	// 회원탈퇴
	public int userDelete(String id);

	public List<UserVO> MentorRecommend();
}
