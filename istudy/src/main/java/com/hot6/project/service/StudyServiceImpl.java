package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.StudyDAO;
import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.StudyVO;

@Service
public class StudyServiceImpl implements StudyService{
	@Inject
	StudyDAO dao;


	@Override
	public List<StudyVO> StudyRecommend(String user_id) {
		return dao.StudyRecommend(user_id);
	}


	@Override
	public List<String> StudyLangType(int study_num) {
		return dao.StudyLangType(study_num);
	}


	@Override
	public List<String> StudyTag(int study_num) {
		return dao.StudyTag(study_num);
	}


	@Override
	public int StudyboardInsert(BoardVO vo) {
		return dao.StudyboardInsert(vo);
	}


	@Override
	public StudyVO getStudyByStudynum(int study_num) {
		return dao.getStudyByStudynum(study_num);
	}


	@Override
	public List<StudyVO> StudyMates(int study_num) {
		return dao.StudyMates(study_num);
	}


}