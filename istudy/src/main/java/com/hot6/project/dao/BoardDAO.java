package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.BoardVO;

@Mapper
@Repository
public interface BoardDAO {
	// 파일명 선택
	public BoardVO getFileName(int board_num);
	public int getStudy_num(int board_num);
	public int getType_num(int board_num);
	
	// 글삭제
	public int boardDelete(int board_num);
}
