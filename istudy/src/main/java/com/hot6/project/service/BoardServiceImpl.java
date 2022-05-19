package com.hot6.project.service;

import java.util.List;

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

	@Override
	public int boardInsert(BoardVO vo) {
		return dao.boardInsert(vo);
	}

	@Override
	public int boardNum(String user_id) {
		return dao.boardNum(user_id);
	}

	@Override
	public int boardFileInsert(BoardVO vo) {
		return dao.boardFileInsert(vo);
	}

	@Override
	public List<BoardVO> replyList(String user_id, int board_num) {
		return dao.replyList(user_id, board_num);
	}

	@Override
	public int hitUp(int board_num) {
		return dao.hitUp(board_num);
	}

	@Override
	public int BoardUpdate(BoardVO vo) {
		return dao.BoardUpdate(vo);
	}

	@Override
	public int BoardFileUpdate(BoardVO vo) {
		return dao.BoardFileUpdate(vo);
	}

	@Override
	public int expUpBoard(String user_id) {
		return dao.expUpBoard(user_id);
	}

	@Override
	public int expUpReply(String user_id) {
		return dao.expUpReply(user_id);
	}

	@Override
	public int expUpLike(String user_id) {
		return dao.expUpLike(user_id);
	}

	@Override
	public int expUpSelected(String user_id) {
		return dao.expUpSelected(user_id);
	}

	@Override
	public int expDownBoard(String user_id) {
		return dao.expDownBoard(user_id);
	}

	@Override
	public int expDownReply(String user_id) {
		return dao.expDownReply(user_id);
	}

	@Override
	public int expDownLike(String user_id) {
		return dao.expDownLike(user_id);
	}

	@Override
	public int expDownSelected(String user_id) {
		return dao.expDownSelected(user_id);
	}

	@Override
	public String getIdByBoardnum(int board_num) {
		return dao.getIdByBoardnum(board_num);
	}

	@Override
	public String getIdByReplynum(int reply_num) {
		return dao.getIdByReplynum(reply_num);
	}

}
