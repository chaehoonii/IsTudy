package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.BoardVO;

@Mapper
@Repository
public interface QnaDAO {
	//총 질문 수
	public int TotalQna();

	// 질문 리스트
	public List<BoardVO> QnaList();

	// 언어타입
	public List<String> QnaLangType(int board_num);

	// 태그
	public List<String> QnaTag(int board_num);
	
	// 검색 기능
	public int TotalQna_title(String searchWord);
	public List<BoardVO> QnaList_title(String searchWord);
	public int TotalQna_content(String searchWord);
	public List<BoardVO> QnaList_content(String searchWord);
	public int TotalQna_nick(String searchWord);
	public List<BoardVO> QnaList_nick(String searchWord);
	public int TotalQna_lang(String searchWord);
	public List<BoardVO> QnaList_lang(String searchWord);
	public int TotalQna_tag(String searchWord);
	public List<BoardVO> QnaList_tag(String searchWord);
	
	//글 내용
	public BoardVO QnaView(int board_num);
	
	//댓글 리스트
	public List<BoardVO> QnaReplyList(String user_id, int board_num);
	
	//댓글 등록
	public int QnaReplyWrite(BoardVO vo);
	
	//좋아요 누르기
	public int LikeUp(String user_id, int reply_num);
	//좋아요 취소
	public int LikeDown(String user_id, int reply_num);
	
	//댓글 삭제
	public int ReplyDel(int reply_num);
}
