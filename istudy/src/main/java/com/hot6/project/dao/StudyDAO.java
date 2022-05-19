package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.StudyVO;

@Mapper
@Repository
public interface StudyDAO {
	// 메인페이지 - 스터디 추천
	public List<StudyVO> StudyRecommend(String user_id);

	public List<String> StudyLangType(int study_num);

	public List<String> StudyTag(int study_num);

	// 스터디 게시판 등록
	public int StudyboardInsert(BoardVO vo);

	// study_num으로 스터디 가져오기
	public StudyVO getStudyByStudynum(int study_num);

	// 스터디원 리스트
	public List<StudyVO> StudyMates(int study_num);
}