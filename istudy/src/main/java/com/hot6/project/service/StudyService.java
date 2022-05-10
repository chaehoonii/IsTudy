package com.hot6.project.service;

import java.util.List;

import com.hot6.project.vo.StudyVO;

public interface StudyService {
	// 달력
	public List<StudyVO> CalendarList(int study_num);

	// 일정 등록
	public int PlanInsert(StudyVO vo);

	// 메인페이지 - 스터디 추천
	public List<StudyVO> StudyRecommend(String user_id);
	public List<String> StudyLangType(int study_num);
	public List<String> StudyTag(int study_num);

	// 일정 상세
	public StudyVO CalendarDetail(int plan_num);
	
	// 일정 삭제
	public int CalendarDel(int plan_num);
	
	//일정 수정
	public int CalendarEdit(StudyVO vo);
	
	
}
