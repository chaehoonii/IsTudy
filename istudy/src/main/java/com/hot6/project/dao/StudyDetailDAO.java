package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.StudyVO;

@Mapper
@Repository
public interface StudyDetailDAO {
	// 스터디글 상세보기
	public StudyVO studydetail(int study_num);

	public List<StudyVO> studyuser(int study_num);
		
	public StudyVO studyRoom(int study_num);
		
	// 좋아요 누르기
	public int LikeUp(String user_id, int study_num);

	// 좋아요 취소
	public int LikeDown(String user_id, int study_num);


	public StudyVO LikeDetail(String user_id, int study_num);

	public List<StudyVO> mateList(int study_num);
	
	public int applyWrite(StudyVO vo);

	public String getIdByWantnum(int want_num);

	public int applyDel(int want_num);

	public StudyVO getOneReply(int want_num);

	public int applyEditOk(StudyVO vo);
	
	public List<StudyVO> applyList(int study_num);
	
	// 신청 수락
	public int ApplySelect(int want_num);

	// 스터디원 강퇴
	public int ApplySelectDel(int want_num);
}
