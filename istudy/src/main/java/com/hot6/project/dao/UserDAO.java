package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.UserVO;

@Mapper
@Repository
public interface UserDAO {
	public List<UserVO> MentorRecommend();
}
