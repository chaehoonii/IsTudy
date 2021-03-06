package com.hot6.project.service;

import java.util.List;

import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.PagingVO;

public interface QnaService {
	// 총 질문 수
	public int TotalQna();

	// 질문 리스트
	public List<BoardVO> QnaList(PagingVO pvo);

	// 언어타입
	public List<String> QnaLangType(int board_num);

	public List<Integer> QnaLangNum(int board_num);

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

	// 글 내용
	public BoardVO QnaView(int board_num);

	// 좋아요 누르기
	public int LikeUp(String user_id, int reply_num);

	// 좋아요 취소
	public int LikeDown(String user_id, int reply_num);

	// 답변 채택
	public int ReplySelect(int reply_num);

	// 답변 채택 취소
	public int ReplySelectDel(int reply_num);

	// 채택여부
	public int getSolved(int board_num);

	// 글 수정
	public int qnaTagDelete(BoardVO vo);

	public int qnaLangDelete(BoardVO vo);

	// 글 등록
	public int qnaTagInsert(BoardVO vo);

	public int qnaLangInsert(BoardVO vo);
	
}
