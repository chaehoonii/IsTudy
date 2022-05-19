package com.hot6.project.service;

import java.util.List;

import com.hot6.project.vo.StudyVO;

public interface StudyDetailService {
	// 스터디글 상세보기
		public List<StudyVO> studydetail(int study_num);

		public List<StudyVO> studyuser(int study_num);
}