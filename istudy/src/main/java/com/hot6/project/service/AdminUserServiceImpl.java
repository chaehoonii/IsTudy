package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.AdminUserDAO;

import com.hot6.project.vo.AdminUserVO;
import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.PagingVO;

import com.hot6.project.vo.UserVO;

@Service
public class AdminUserServiceImpl implements AdminUserService {

	@Inject
	AdminUserDAO dao;

	@Override
	public List<UserVO> getUserInfo(String permission, String want, PagingVO pvo) {
		return dao.getUserInfo(permission, want, pvo);
	}

	@Override
	public int getAllCnt(String permission, String want, PagingVO pvo) {
		return dao.getAllCnt(permission, want, pvo);
	}

	@Override
	public int getPermissionCnt(String permission, String want) {
		return dao.getPermissionCnt(permission, want);
	}

	@Override
	public int approveUserStatus(UserVO vo) {
		return dao.approveUserStatus(vo);
	}

	@Override
	public int sendBackStatus(UserVO vo) {
		return dao.sendBackStatus(vo);
	}

	@Override
	public List<AdminUserVO> getAdminUserInfo(String confirm, PagingVO pvo) {
		return dao.getAdminUserInfo(confirm, pvo);
	}

	@Override
	public int getAllReportCnt(String confirm, PagingVO pvo) {
		return dao.getAllReportCnt(confirm, pvo);
	}

	@Override
	public int getBoard_num() {
		return dao.getBoard_num();
	}

	@Override
	public int getReport_num() {
		return dao.getReport_num();
	}

	@Override
	public int getReport_type_num() {
		return dao.getReport_type_num();
	}

	@Override
	public String getUser_id() {
		return dao.getUser_id();
	}

	@Override
	public String getReport_content() {
		return dao.getReport_content();
	}

	@Override
	public String getReport_time() {
		return dao.getReport_time();
	}

	@Override
	public String getTitle() {
		return dao.getTitle();
	}

	@Override
	public String getWriter() {
		return dao.getWriter();
	}

	@Override
	public int getStandbyReportCnt() {
		return dao.getStandbyReportCnt();
	}

	@Override
	public int getConfirmReportCnt() {
		return dao.getConfirmReportCnt();
	}

	@Override
	public String getConfirm() {
		return dao.getConfirm();
	}

	@Override
	public BoardVO getReportWritingModal(int getBoardnum) {
		return dao.getReportWritingModal(getBoardnum);
	}

	@Override
	public AdminUserVO getReportContentModal(int getReportnum) {
		return dao.getReportContentModal(getReportnum);
	}

	@Override
	public int getConfirmUpdate(AdminUserVO vo) {
		return dao.getConfirmUpdate(vo);
	}

	@Override
	public int getAdminDelete(AdminUserVO vo) {
		return dao.getAdminDelete(vo);
	}

	@Override
	public int getAllReportPagingCnt(String confirm, PagingVO pvo) {
		return dao.getAllReportPagingCnt(confirm, pvo);
	}
}
