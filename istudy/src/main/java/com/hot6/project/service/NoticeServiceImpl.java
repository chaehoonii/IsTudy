package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.NoticeDAO;
import com.hot6.project.vo.BoardVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Inject
	NoticeDAO dao;

	@Override
	public List<BoardVO> selectNoticeList(BoardVO vo) {
		return dao.selectNoticeList(vo);
	}
}
