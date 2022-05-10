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
	public List<StudyInfoVO> studyHome(PagingVO vo);
	/*
	 * // 스터디글 등록 public int studyinfoInsert(StudyInfoVO vo); // 스터디글 상세보기 public
	 * StudyInfoVO studyinfoSelect(int study_num); // 스터디글 수정 public int
	 * studyinfoUpdate(StudyInfoVO vo); // 스터디글 삭제 public int studyinfoDelete(int
	 * study_num);
	 */
	public List<String> studyLang(int study_num);
	public List<StudyInfoVO> langAll();
}
