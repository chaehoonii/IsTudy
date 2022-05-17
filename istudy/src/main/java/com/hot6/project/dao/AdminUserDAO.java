package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.hot6.project.vo.AdminUserVO;
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
	
	//전체 신고 정보 가져오기
	public List<AdminUserVO> getAdminUserInfo();
	
	//전체 신고 수
	public int getAllReportCnt();
		
	//신고 분류
	public int getReport_type_num();

	//신고자
	public String getUser_id();
	
	//신고 내용
	public String getReport_content();
	
	//신고일
	public String getReport_time();
	
	//신고글
	public String getTitle();
	
	//작성자
	public String getWriter();
	
	//처리상태
	public String getProcess_status();
}