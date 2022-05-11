package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.QnaDAO;
import com.hot6.project.vo.BoardVO;

@Service
public class QnaServiceImpl implements QnaService{
	@Inject
	QnaDAO dao;

	@Override
	public int TotalQna() {
		return dao.TotalQna();
	}

	@Override
	public List<BoardVO> QnaList() {
		return dao.QnaList();
	}

	@Override
	public List<String> QnaLangType(int board_num) {
		return dao.QnaLangType(board_num);
	}

	@Override
	public List<String> QnaTag(int board_num) {
		return dao.QnaTag(board_num);
	}

	@Override
	public List<BoardVO> QnaList_title(String searchWord) {
		return dao.QnaList_title(searchWord);
	}

	@Override
	public List<BoardVO> QnaList_content(String searchWord) {
		return dao.QnaList_content(searchWord);
	}

	@Override
	public List<BoardVO> QnaList_nick(String searchWord) {
		return dao.QnaList_nick(searchWord);
	}

	@Override
	public List<BoardVO> QnaList_lang(String searchWord) {
		return dao.QnaList_lang(searchWord);
	}

	@Override
	public List<BoardVO> QnaList_tag(String searchWord) {
		return dao.QnaList_tag(searchWord);
	}

	@Override
	public int TotalQna_title(String searchWord) {
		return dao.TotalQna_title(searchWord);
	}

	@Override
	public int TotalQna_content(String searchWord) {
		return dao.TotalQna_content(searchWord);
	}

	@Override
	public int TotalQna_nick(String searchWord) {
		return dao.TotalQna_nick(searchWord);
	}

	@Override
	public int TotalQna_lang(String searchWord) {
		return dao.TotalQna_lang(searchWord);
	}

	@Override
	public int TotalQna_tag(String searchWord) {
		return dao.TotalQna_tag(searchWord);
	}

	@Override
	public BoardVO QnaView(int board_num) {
		return dao.QnaView(board_num);
	}

	@Override
	public List<BoardVO> QnaReplyList(String user_id, int board_num) {
		return dao.QnaReplyList(user_id, board_num);
	}

	@Override
	public int QnaReplyWrite(BoardVO vo) {
		return dao.QnaReplyWrite(vo);
	}

	@Override
	public int LikeUp(String user_id, int reply_num) {
		return dao.LikeUp(user_id, reply_num);
	}

	@Override
	public int LikeDown(String user_id, int reply_num) {
		return dao.LikeDown(user_id, reply_num);
	}

	@Override
	public int ReplyDel(int reply_num) {
		return dao.ReplyDel(reply_num);
	}
	
	
}
