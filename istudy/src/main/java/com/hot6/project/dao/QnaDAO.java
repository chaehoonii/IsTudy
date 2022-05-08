package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.BoardVO;

@Mapper
@Repository
public interface QnaDAO {
	//총 질문 수
	public int TotalQna();

	// 질문 리스트
	public List<BoardVO> QnaList();

	// 언어타입
	public List<String> QnaLangType(int board_num);

	// 태그
	public List<String> QnaTag(int board_num);
}
