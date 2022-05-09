package com.hot6.project.service;

import java.util.List;

import com.hot6.project.vo.BoardVO;

public interface NoticeService {
	public List<BoardVO> selectNoticeList(BoardVO vo);
}
