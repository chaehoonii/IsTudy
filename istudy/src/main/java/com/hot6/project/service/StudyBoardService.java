package com.hot6.project.service;

import java.util.List;

import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.StudyVO;

public interface StudyBoardService {
	//총 게시글 수
	public int TotalStudyBoardList(int study_num);

	//글 목록
	public List<BoardVO> StudyBoardList(int study_num);
	
}
