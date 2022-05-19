package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.PagingVO;
import com.hot6.project.vo.StudyVO;

@Mapper
@Repository
public interface StudyInfoDAO {
	// 스터디 정보 페이지
	public List<StudyVO> studyHome(PagingVO vo);
	public List<String> studyLang(int study_num);
	public List<StudyVO> langAll();
	public List<String> StudyTag(int study_num);
	public StudyVO studyPeople(int study_num);
}
