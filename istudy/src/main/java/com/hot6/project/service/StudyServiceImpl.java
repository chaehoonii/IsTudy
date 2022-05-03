package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.StudyDAO;
import com.hot6.project.vo.StudyVO;

@Service
public class StudyServiceImpl implements StudyService{
	@Inject
	StudyDAO dao;

	@Override
	public List<StudyVO> CalendarList(int study_num) {
		return dao.CalendarList(study_num);
	}

}
