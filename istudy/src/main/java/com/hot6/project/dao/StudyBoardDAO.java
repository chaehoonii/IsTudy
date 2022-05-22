package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.BoardVO;

@Mapper
@Repository
public interface StudyBoardDAO {

	//총 질문 수
	public int TotalStudyBoardList(int study_num);

	//글 목록
	public List<BoardVO> StudyBoardList(int study_num);
	

}
