package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.StudyBoardDAO;
import com.hot6.project.vo.BoardVO;

@Service
public class StudyBoardServiceImpl implements StudyBoardService {
	@Inject
	StudyBoardDAO dao;

	@Override
	public int TotalStudyBoardList(int study_num) {
		
		return dao.TotalStudyBoardList(study_num);
	}

	@Override
	public List<BoardVO> StudyBoardList(int study_num) {
		
		return dao.StudyBoardList(study_num);
	}



}
