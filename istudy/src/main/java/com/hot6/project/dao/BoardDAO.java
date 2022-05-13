package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.BoardVO;

@Mapper
@Repository
public interface BoardDAO {
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

	public int boardTagInsert(BoardVO vo);

	public int boardLangInsert(BoardVO vo);
	
	//조회수 올리기
	public int hitUp(int board_num);
}
