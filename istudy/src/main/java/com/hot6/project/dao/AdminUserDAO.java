package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.UserVO;

@Mapper
@Repository
public interface AdminUserDAO {
	
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
