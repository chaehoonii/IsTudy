package com.hot6.project.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.StudyRegisterVO;

@Mapper
@Repository
public interface StudyRegisterDAO {
	//스터디 등록
	public int studyInsert(StudyRegisterVO vo);
	//스터디 룸 이름 중복 체크
	public int studynameCheck(String name);
	//
	
}
