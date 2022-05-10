package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.PagingVO;
import com.hot6.project.vo.StudyInfoVO;

@Mapper
@Repository
public interface StudyInfoDAO {
	// 스터디 정보 페이지
	public List<StudyInfoVO> studyInfo(int study_num, PagingVO vo);
	public List<String> studyLang(int study_num); // 스터디글 목록 언어
	public List<StudyInfoVO> langAll(); // 카테고리 언어
}
