package com.hot6.project.service;

import java.util.List;

import com.hot6.project.vo.StudyVO;

public interface StudyService {
	// 달력
	public List<StudyVO> CalendarList(int study_num);

	// 일정 등록
	public int PlanInsert(StudyVO vo);
}
