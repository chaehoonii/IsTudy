package com.hot6.project.service;

import java.util.List;

import com.hot6.project.vo.StudyVO;

public interface StudyDetailService {
	// 스터디글 상세보기
	public StudyVO studydetail(int study_num);

	public List<StudyVO> studyuser(int study_num);
	
	public StudyVO studyRoom(int study_num);
		
	// 좋아요 누르기
	public int LikeUp(String user_id, int study_num);

	// 좋아요 취소
	public int LikeDown(String user_id, int study_num);

	public StudyVO LikeDetail(String user_id, int study_num);

	public List<StudyVO> mateList(int study_num);
}