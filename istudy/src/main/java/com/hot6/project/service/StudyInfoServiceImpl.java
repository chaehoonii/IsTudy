package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.StudyInfoDAO;
import com.hot6.project.vo.PagingVO;
import com.hot6.project.vo.StudyVO;

@Service
public class StudyInfoServiceImpl implements StudyInfoService{
	@Inject
	StudyInfoDAO dao;
	
	// 스터디글 정보페이지
	@Override
	public List<StudyVO> studyHome(PagingVO pvo) {
		return dao.studyHome(pvo);
	}
	public List<String> studyLang(int study_num){
		return dao.studyLang(study_num);
	}
	public List<StudyVO> langAll(){
		return dao.langAll();
	}

	public List<String> StudyTag(int study_num){
		return dao.StudyTag(study_num);
	}

	public StudyVO studyPeople(int study_num) {
		return dao.studyPeople(study_num);
	}
	@Override
	public int totalRecord(int study_type_num) {
		return dao.totalRecord(study_type_num);
	}
}
