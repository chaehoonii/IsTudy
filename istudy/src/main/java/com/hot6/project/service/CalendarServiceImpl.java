package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.CalendarDAO;
import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.StudyVO;

@Service
public class CalendarServiceImpl implements CalendarService{
	@Inject
	CalendarDAO dao;

	@Override
	public List<StudyVO> CalendarList(int study_num) {
		return dao.CalendarList(study_num);
	}

	@Override
	public int PlanInsert(StudyVO vo) {
		return dao.PlanInsert(vo);
	}
	
	@Override
	public StudyVO CalendarDetail(int plan_num) {
		return dao.CalendarDetail(plan_num);
	}

	@Override
	public int CalendarDel(int plan_num) {
		return dao.CalendarDel(plan_num);
	}

	@Override
	public int CalendarEdit(StudyVO vo) {
		return dao.CalendarEdit(vo);
	}
	
	@Override
	public int CalendarDrag(StudyVO vo) {
		return dao.CalendarDrag(vo);
	}

}
