package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.StudyVO;

@Mapper
@Repository
public interface CalendarDAO {
	// 달력
	public List<StudyVO> CalendarList(int study_num);

	// 일정 등록
	public int PlanInsert(StudyVO vo);

	// 일정 상세
	public StudyVO CalendarDetail(int plan_num);

	// 일정 삭제
	public int CalendarDel(int plan_num);

	// 일정 수정
	public int CalendarEdit(StudyVO vo);

	// 일정 드래그 수정
	public int CalendarDrag(StudyVO vo);
}
