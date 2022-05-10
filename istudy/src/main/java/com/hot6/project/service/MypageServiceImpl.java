package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.MypageDAO;
import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.StudyVO;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Inject
	MypageDAO dao;
	
	@Override
	public List<StudyVO> joinStudy(String user_id) {	
		return dao.joinStudy(user_id);
	}

	@Override
	public List<StudyVO> finishStudy(String user_id) {
		return dao.finishStudy(user_id);
	}

	@Override
	public List<BoardVO> getArticles(String user_id) {
		return dao.getArticles(user_id);
	}

	@Override
	public List<BoardVO> getComments(String user_id) {
		return dao.getComments(user_id);
	}
	
	

}
