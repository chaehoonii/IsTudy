package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.UserDAO;
import com.hot6.project.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	@Inject
	UserDAO dao;

	@Override
	public List<UserVO> MentorRecommend() {
		return dao.MentorRecommend();
	}

	@Override
	public UserVO loginCheck(UserVO vo) {
		return dao.loginCheck(vo);
	}

	@Override
	public String findId(UserVO vo) {
		return dao.findId(vo);
	}

	@Override
	public int matchUser(UserVO vo) {
		return dao.matchUser(vo);
	}

	@Override
	public int pwdUpdate(String newPwd, UserVO vo) {
		return dao.pwdUpdate(newPwd, vo);
	}

	

}
