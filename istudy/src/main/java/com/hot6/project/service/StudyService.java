package com.hot6.project.service;

import java.util.List;

import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.StudyVO;

public interface StudyService {
	// 메인페이지 - 스터디 추천
	public List<StudyVO> StudyRecommend(String user_id);

	public List<String> StudyLangType(int study_num);

	public List<String> StudyTag(int study_num);

	// 스터디 게시판 등록
	public int StudyboardInsert(BoardVO vo);
}
