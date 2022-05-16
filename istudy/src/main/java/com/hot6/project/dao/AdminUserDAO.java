package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.PagingVO;
import com.hot6.project.vo.UserVO;

@Mapper
@Repository
public interface AdminUserDAO {
	
	//전체 회원 정보 가져오기
	public List<UserVO> getUserInfo(PagingVO pvo);
	
	//전체 회원 수
	public int getAllCnt(String permission, String want);
	
	//일반 회원 수
	public int getUserCnt();
	
	//멘토 회원 수
	public int getMentorCnt();
	
	//관리자 수
	public int getAdminCnt();
	
	//해당 회원
	public List<UserVO> userPermission(String permission, PagingVO pvo);
	
	//멘토 신청 결과 대기 회원
	public List<UserVO> userWant(String permission, String want, PagingVO pvo);
	
	//멘토 신청 승인
	public int approveUserStatus(UserVO vo);
	
	//멘토 신청 반려
	public int sendBackStatus(UserVO vo);

}
