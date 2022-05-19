package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.AdminDataDAO;
import com.hot6.project.vo.StudyVO;
import com.hot6.project.vo.UserVO;

@Service
public class AdminDataServiceImpl implements AdminDataService {

	@Inject
	AdminDataDAO dao;

	@Override
	public int get_study_cnt(int study_type_num) {
		return dao.get_study_cnt(study_type_num);
	}

	@Override
	public List<StudyVO> get_popular_study() {
		return dao.get_popular_study();
	}

	@Override
	public List<UserVO> get_new_member() {
		return dao.get_new_member();
	}

}
