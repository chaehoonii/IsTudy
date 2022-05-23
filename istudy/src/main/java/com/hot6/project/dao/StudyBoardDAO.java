package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.AdminUserVO;
import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.PagingVO;

@Mapper
@Repository
public interface StudyBoardDAO {

		//총 게시글 수
		public int TotalStudyBoardList(int study_num);

		// 질문 리스트
		public List<BoardVO> StudyBoardList(int study_num, PagingVO pvo);

		// 글 내용
		public BoardVO StudyBoardView(int board_num);

		// 좋아요 누르기
		public int LikeUp(String user_id, int reply_num);

		// 좋아요 취소
		public int LikeDown(String user_id, int reply_num);
		
		public int setTotalRecord(int board_type);

		//신고하기
		public int reportJoin(AdminUserVO vo, int board_num);

}
