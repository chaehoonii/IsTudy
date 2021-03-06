package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.NoticeDAO;
import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.PagingVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Inject
	NoticeDAO dao;

	@Override
	public List<BoardVO> selectNoticeList(PagingVO pvo) {
		return dao.selectNoticeList(pvo);
	}

	@Override
	public BoardVO selectNoticeModal(int seletedNoticeNum){
		return dao.selectNoticeModal(seletedNoticeNum);
	}

	@Override
	public int setTotalRecord(int board_type) {
		return dao.setTotalRecord(board_type);
	}


}
