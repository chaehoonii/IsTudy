package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.AdminUserVO;
import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.PagingVO;

import com.hot6.project.vo.UserVO;

@Mapper
@Repository
public interface AdminUserDAO {

	// 회원 정보 가져오기
	public List<UserVO> getUserInfo(String permission, String want, PagingVO pvo);

	// 레코드 수
	public int getAllCnt(String permission, String want, PagingVO pvo);

	// 해당 회원 수
	public int getPermissionCnt(String permission, String want);

	// 멘토 신청 승인
	public int approveUserStatus(UserVO vo);

	// 멘토 신청 반려
	public int sendBackStatus(UserVO vo);

	// 관리자 수
	public int getAdminCnt();

	// 전체 신고 정보 가져오기
	public List<AdminUserVO> getAdminUserInfo(String confirm, PagingVO pvo);

	// 전체 신고 수
	public int getAllReportCnt(String confirm, PagingVO pvo);

	// 대기 신고 수
	public int getStandbyReportCnt();

	// 확인 신고 수
	public int getConfirmReportCnt();

	// 게시물 번호
	public int getBoard_num();

	// 신고 번호
	public int getReport_num();

	// 신고 분류
	public int getReport_type_num();

	// 신고자
	public String getUser_id();

	// 신고 내용
	public String getReport_content();

	// 신고일
	public String getReport_time();

	// 신고글
	public String getTitle();

	// 작성자
	public String getWriter();

	// 처리상태
	public String getConfirm();

	// 모달 선택
	public BoardVO getReportWritingModal(int getBoardnum);

	// 모달 선택
	public AdminUserVO getReportContentModal(int getReportnum);

	// 처리 상태 변경
	public int getConfirmUpdate(AdminUserVO vo);

	// 페이징용 신고 수
	public int getAllReportPagingCnt(String confirm, PagingVO pvo);

	// 신고 게시자 탈퇴
	public int getAdminDelete(AdminUserVO vo);

}