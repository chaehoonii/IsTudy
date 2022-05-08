package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.StudyVO;

@Mapper
@Repository
public interface StudyDAO {
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
	
	//마이페이지 진행 스터디 
	public List<StudyVO> joinStudy(String user_id);
		
	//마이페이지 완료 스터디
	public List<StudyVO> finishStudy(String user_id);
}
