package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.AdminUserDAO;
import com.hot6.project.vo.AdminUserVO;
import com.hot6.project.vo.UserVO;

@Service
public class AdminUserServiceImpl implements AdminUserService {
	
	@Inject
	AdminUserDAO dao;

	@Override
	public List<UserVO> getUserInfo() {
		return dao.getUserInfo();
	}

	@Override
	public int getAllCnt() {
		return dao.getAllCnt();
	}

	@Override
	public int getUserCnt() {
		return dao.getUserCnt();
	}

	@Override
	public int getMentorCnt() {
		return dao.getMentorCnt();
	}

	@Override
	public int getAdminCnt() {
		return dao.getAdminCnt();
	}
	
	@Override
	public List<AdminUserVO> getAdminUserInfo() {
		return dao.getAdminUserInfo();
	}

	@Override
	public int getAllReportCnt() {
		return dao.getAllCnt();
	}
	
	@Override
	public int getReport_type_num() {
		return dao.getReport_type_num();
	}

	@Override
	public String getUser_id() {
		return dao.getUser_id();
	}

	@Override
	public String getReport_content() {
		return dao.getReport_content();
	}

	@Override
	public String getReport_time() {
		return dao.getReport_time();
	}

	@Override
	public String getTitle() {
		return dao.getTitle();
	}

	@Override
	public String getWriter() {
		return dao.getWriter();
	}

	@Override
	public String getProcess_status() {
		return dao.getProcess_status();
	}

}
