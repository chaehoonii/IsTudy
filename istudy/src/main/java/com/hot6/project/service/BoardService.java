package com.hot6.project.service;

import java.util.List;

import com.hot6.project.vo.BoardVO;

public interface BoardService {
	// 파일명 선택
	public BoardVO getFileName(int board_num);
	public int getStudy_num(int board_num);
	public int getType_num(int board_num);
	// 글삭제
	public int boardDelete(int board_num);
	
}
