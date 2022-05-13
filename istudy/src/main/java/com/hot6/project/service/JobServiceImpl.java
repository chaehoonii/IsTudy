package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.JobDAO;
import com.hot6.project.dao.CalendarDAO;
import com.hot6.project.vo.JobVO;

@Service
public class JobServiceImpl implements JobService{
	@Inject
	JobDAO dao;

	@Override
	public List<JobVO> JobRecommend() {
		return dao.JobRecommend();
	}
	
	
}
