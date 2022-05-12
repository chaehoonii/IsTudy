package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.PagingVO;

@Mapper
@Repository
public interface NoticeDAO {
	public List<BoardVO> selectNoticeList(BoardVO vo, PagingVO pvo);
	public BoardVO selectNoticeModal(int board_num);
	public int setTotalRecord(int board_type);
}
