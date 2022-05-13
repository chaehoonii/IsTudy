package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.AdminUserDAO;
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
	
	

}
