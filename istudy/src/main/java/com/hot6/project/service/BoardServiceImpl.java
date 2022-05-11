package com.hot6.project.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.BoardDAO;
import com.hot6.project.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	BoardDAO dao;

	@Override
	public BoardVO getFileName(int board_num) {
		return dao.getFileName(board_num);
	}

	@Override
	public int boardDelete(int board_num) {
		return dao.boardDelete(board_num);
	}

	@Override
	public int getType_num(int board_num) {
		return dao.getType_num(board_num);
	}

	@Override
	public int getStudy_num(int board_num) {
		return dao.getStudy_num(board_num);
	}

	@Override
	public int replyWrite(BoardVO vo) {
		return dao.replyWrite(vo);
	}

	@Override
	public int replyDel(int reply_num) {
		return dao.replyDel(reply_num);
	}

	@Override
	public BoardVO getOneReply(int reply_num) {
		return dao.getOneReply(reply_num);
	}

	@Override
	public int replyEditOk(BoardVO vo) {
		return dao.replyEditOk(vo);
	}

}
