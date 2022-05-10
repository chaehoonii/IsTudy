package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.StudyVO;

@Mapper
@Repository
public interface MypageDAO {
	
	//마이페이지 진행 스터디 
	public List<StudyVO> joinStudy(String user_id);
			
	//마이페이지 완료 스터디
	public List<StudyVO> finishStudy(String user_id);
	
	//마이페이지 작성한 글
	public List<BoardVO> getArticles(String user_id);
	
	//마이페이지 댓글 단 글
	public List<BoardVO> getComments(String user_id);

}
