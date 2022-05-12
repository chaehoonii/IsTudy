package com.hot6.project.service;

import java.util.List;

import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.PagingVO;

public interface NoticeService {
	public List<BoardVO> selectNoticeList(BoardVO vo, PagingVO pvo);
	public BoardVO selectNoticeModal(int board_num);
	public int setTotalRecord(int board_type);
}
