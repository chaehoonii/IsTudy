package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.PagingVO;
import com.hot6.project.vo.UserVO;

@Mapper
@Repository
public interface AdminUserDAO {
	
	//회원 정보 가져오기
	public List<UserVO> getUserInfo(String permission, String want, PagingVO pvo);
	
	//레코드 수
	public int getAllCnt(String permission, String want, PagingVO pvo);
	
	//해당 회원 수
	public int getPermissionCnt(String permission, String want);
	
	//멘토 신청 승인
	public int approveUserStatus(UserVO vo);
	
	//멘토 신청 반려
	public int sendBackStatus(UserVO vo);

	//관리자 수
	public int getAdminCnt();

	
}
