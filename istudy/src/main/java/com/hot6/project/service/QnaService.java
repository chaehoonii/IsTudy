package com.hot6.project.service;

import java.util.List;

import com.hot6.project.vo.BoardVO;

public interface QnaService {
	// 총 질문 수
	public int TotalQna();

	// 질문 리스트
	public List<BoardVO> QnaList();

	// 언어타입
	public List<String> QnaLangType(int board_num);

	// 태그
	public List<String> QnaTag(int board_num);
}
