package com.hot6.project.service;

import java.util.List;

import com.hot6.project.vo.PagingVO;
import com.hot6.project.vo.StudyInfoVO;

public interface StudyInfoService {
	// 스터디 정보 페이지
	public List<StudyInfoVO> studyInfo(int study_num, PagingVO vo);
	public List<String> studyLang(int study_num);
	public List<StudyInfoVO> langAll();
	
	
	
}
