package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.PagingVO;

@Mapper
@Repository
public interface NoticeDAO {
	public List<BoardVO> selectNoticeList(PagingVO pvo);
	public BoardVO selectNoticeModal(int seletedNoticeNum);
	public int setTotalRecord(int board_type);
}
