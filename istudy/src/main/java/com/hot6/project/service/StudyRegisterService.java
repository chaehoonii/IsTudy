package com.hot6.project.service;

import com.hot6.project.vo.StudyVO;

public interface StudyRegisterService {
	//스터디 등록
	public int studyInsert(StudyVO vo, String filePath);

	public int studyTagInsert(StudyVO vo);		
	public int studyLangInsert(StudyVO vo);

}
