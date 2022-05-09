package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.BoardVO;

@Mapper
@Repository
public interface NoticeDAO {
	public List<BoardVO> selectNoticeList(BoardVO vo);
}
