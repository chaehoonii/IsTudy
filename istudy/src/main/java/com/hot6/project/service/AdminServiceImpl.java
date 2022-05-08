package com.hot6.project.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	@Inject
	AdminDAO dao;
}
