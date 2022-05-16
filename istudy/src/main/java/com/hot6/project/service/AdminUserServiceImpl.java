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
	public List<UserVO> getUserInfo(PagingVO pvo) {
		return dao.getUserInfo(pvo);
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
	public List<UserVO> userPermission(String permission, PagingVO pvo) {
		return dao.userPermission(permission, pvo);
	}

	@Override
	public List<UserVO> userWant(String permission, String want, PagingVO pvo) {
		return dao.userWant(permission, want, pvo);
	}

	@Override
	public int approveUserStatus(UserVO vo) {
		return dao.approveUserStatus(vo);
	}

	@Override
	public int sendBackStatus(UserVO vo) {
		return dao.sendBackStatus(vo);
	}

	@Override
	public int getAllCnt(String permission, String want) {
		return dao.getAllCnt(permission, want);
	}


}
