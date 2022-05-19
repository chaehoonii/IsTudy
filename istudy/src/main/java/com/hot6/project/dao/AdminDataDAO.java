package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.StudyVO;
import com.hot6.project.vo.UserVO;

@Mapper
@Repository
public interface AdminDataDAO {
	
	//영역별 스터디 수
	public int get_study_cnt(int study_type_num);
	
	//인기 있는 스터디(like가 많은 스터디) 이름, 개수
	public List<StudyVO> get_popular_study();
	
	//신규 회원 날짜, 신규 회원 수
	public List<UserVO> get_new_member();
	
}
