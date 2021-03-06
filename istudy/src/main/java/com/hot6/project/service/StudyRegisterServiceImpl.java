package com.hot6.project.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.StudyRegisterDAO;
import com.hot6.project.vo.StudyVO;

@Service
public class StudyRegisterServiceImpl implements StudyRegisterService {
	@Inject
	StudyRegisterDAO dao;

	@Override
	public int studyInsert(StudyVO vo, String filePath) {
		return dao.studyInsert(vo, filePath);
	}

	@Override
	public int studyTagInsert(StudyVO vo) {
		return dao.studyTagInsert(vo);
	}

	@Override
	public int studyLangInsert(StudyVO vo) {
		return dao.studyLangInsert(vo);
	}

	@Override
	public int studyNum(String user_id) {
		return dao.studyNum(user_id);
	}
	
	
}
