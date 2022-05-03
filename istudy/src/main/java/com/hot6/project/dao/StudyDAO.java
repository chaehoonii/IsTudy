package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.StudyVO;

@Mapper
@Repository
public interface StudyDAO {
	//달력 상세
	public List<StudyVO> CalendarList(int study_num);
}
