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
	public int studyInsert(StudyVO vo) {
		return dao.studyInsert(vo);
	}
}
