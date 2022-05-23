package com.hot6.project.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.StudyVO;

@Mapper
@Repository
public interface StudyRegisterDAO {
	//스터디 등록
	public int studyInsert(StudyVO vo, String filePath);
	
	public int studyTagInsert(StudyVO vo);		
	public int studyLangInsert(StudyVO vo);
	public int studyNum(String user_id);
	
}
