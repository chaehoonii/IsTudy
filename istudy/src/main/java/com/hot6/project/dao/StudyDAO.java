package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.StudyVO;

@Mapper
@Repository
public interface StudyDAO {
	//달력
	public List<StudyVO> CalendarList(int study_num);
	//일정 등록
	public int PlanInsert(StudyVO vo);
	//메인페이지 - 스터디 추천
	public List<StudyVO> StudyRecommend(String user_id);
}
