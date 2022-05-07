package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.QnaDAO;
import com.hot6.project.vo.BoardVO;

@Service
public class QnaServiceImpl implements QnaService{
	@Inject
	QnaDAO dao;

	@Override
	public int TotalQna() {
		return dao.TotalQna();
	}

	@Override
	public List<BoardVO> QnaList() {
		return dao.QnaList();
	}

	@Override
	public List<String> QnaLangType(int board_num) {
		return dao.QnaLangType(board_num);
	}

	@Override
	public List<String> QnaTag(int board_num) {
		return dao.QnaTag(board_num);
	}


	
	
}
