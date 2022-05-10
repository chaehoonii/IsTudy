package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.vo.PagingVO;
import com.hot6.project.dao.StudyInfoDAO;
import com.hot6.project.vo.StudyInfoVO;

@Service
public class StudyInfoServiceImpl implements StudyInfoService{
	@Inject
	StudyInfoDAO dao;
	
	// 스터디글 정보페이지
	@Override
	public List<StudyInfoVO> studyInfo(int study_num, PagingVO vo) {
		return dao.studyInfo(study_num, vo);
	}
	public List<String> studyLang(int study_num){
		return dao.studyLang(study_num);
	}

	public List<StudyInfoVO> langAll(){
		return dao.langAll();
	}
	
}
