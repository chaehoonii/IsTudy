package com.hot6.project.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.StudyRoomDAO;

@Service
public class StudyRoomServiceImpl implements StudyRoomService{
	@Inject
	StudyRoomDAO dao;



}