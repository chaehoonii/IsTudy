package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.AdminUserDAO;
import com.hot6.project.vo.PagingVO;
import com.hot6.project.vo.UserVO;

@Service
public class AdminUserServiceImpl implements AdminUserService {
	
	@Inject
	AdminUserDAO dao;

	@Override
	public List<UserVO> getUserInfo(String permission, String want, PagingVO pvo) {
		return dao.getUserInfo(permission, want, pvo);
	}
	
	@Override
	public int getAllCnt(String permission, String want, PagingVO pvo) {
		return dao.getAllCnt(permission, want, pvo);
	}

	@Override
	public int getPermissionCnt(String permission, String want) {
		return dao.getPermissionCnt(permission, want);
	}
	
	@Override
	public int approveUserStatus(UserVO vo) {
		return dao.approveUserStatus(vo);
	}

	@Override
	public int sendBackStatus(UserVO vo) {
		return dao.sendBackStatus(vo);
	}

}