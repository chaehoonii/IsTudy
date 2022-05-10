package com.hot6.project.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.StudyRegisterVO;

@Mapper
@Repository
public interface StudyRegisterDAO {
	//스터디 등록
	public int StudyInsert(StudyRegisterVO vo);
	
}
