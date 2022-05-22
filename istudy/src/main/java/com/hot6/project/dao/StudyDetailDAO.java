package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.StudyVO;

@Mapper
@Repository
public interface StudyDetailDAO {
	// 스터디글 상세보기
		public StudyVO studydetail(int study_num);

		public List<StudyVO> studyuser(int study_num);
}
