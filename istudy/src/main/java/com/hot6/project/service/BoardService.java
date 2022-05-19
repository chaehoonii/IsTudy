package com.hot6.project.service;

import java.util.List;

import com.hot6.project.vo.BoardVO;

public interface BoardService {
	// 파일명 선택
	public BoardVO getFileName(int board_num);

	// 글 번호 선택
	public int getStudy_num(int board_num);

	// 게시판 타입 선택
	public int getType_num(int board_num);

	// 글삭제
	public int boardDelete(int board_num);

	// 댓글 리스트
	public List<BoardVO> replyList(String user_id, int board_num);

	// 댓글 등록
	public int replyWrite(BoardVO vo);

	// 댓글 삭제
	public int replyDel(int reply_num);

	// 댓글 수정폼
	public BoardVO getOneReply(int reply_num);

	// 댓글 수정
	public int replyEditOk(BoardVO vo);

	// 글 등록
	public int boardInsert(BoardVO vo);

	public int boardNum(String user_id);

	public int boardFileInsert(BoardVO vo);

	// 조회수 올리기
	public int hitUp(int board_num);

	// 글 수정
	public int BoardUpdate(BoardVO vo);

	public int BoardFileUpdate(BoardVO vo);
	
	//아이디 가져오기
	public String getIdByBoardnum(int board_num);
	public String getIdByReplynum(int reply_num);
	
	//점수 올리기
	public int expUpBoard(String user_id);
	public int expUpReply(String user_id);
	public int expUpLike(String user_id);
	public int expUpSelected(String user_id);
	//점수 내리기
	public int expDownBoard(String user_id);
	public int expDownReply(String user_id);
	public int expDownLike(String user_id);
	public int expDownSelected(String user_id);
}
