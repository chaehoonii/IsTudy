package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.StudyBoardDAO;
import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.PagingVO;

@Service
public class StudyBoardServiceImpl implements StudyBoardService {
	@Inject
	StudyBoardDAO dao;

	@Override
	public List<BoardVO> StudyBoardList(int study_num, PagingVO pvo) {
		return dao.StudyBoardList(study_num, pvo);
	}

	@Override
	public BoardVO StudyBoardView(int board_num) {
		return dao.StudyBoardView(board_num);
	}

	@Override
	public int LikeUp(String user_id, int reply_num) {
		return dao.LikeUp(user_id, reply_num);
	}
	
	@Override
	public int LikeDown(String user_id, int reply_num) {
		return dao.LikeDown(user_id, reply_num);
	}

	@Override
	public int TotalStudyBoardList(int study_num) {
		return dao.TotalStudyBoardList(study_num);
	}

	@Override
	public int setTotalRecord(int board_type) {
		return dao.setTotalRecord(board_type);
	}

}
