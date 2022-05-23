package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.StudyDetailDAO;
import com.hot6.project.vo.StudyVO;

@Service
public class StudyDetailServiceImpl implements StudyDetailService{
	@Inject
	StudyDetailDAO dao;

	// 스터디글 상세보기
	@Override
	public StudyVO studydetail(int study_num) {
		return dao.studydetail(study_num);
	}
	public List<StudyVO> studyuser(int study_num){
		return dao.studyuser(study_num);
	}
	@Override
	public StudyVO studyRoom(int study_num) {
		return dao.studyRoom(study_num);
	}
	// 좋아요
	@Override
	public int LikeUp(String user_id, int study_num) {
		return dao.LikeUp(user_id, study_num);
	}
	@Override
	public int LikeDown(String user_id, int study_num) {
		return dao.LikeDown(user_id, study_num);
	}
	@Override
	public StudyVO LikeDetail(String user_id, int study_num) {
		return dao.LikeDetail(user_id, study_num);
	}
}
