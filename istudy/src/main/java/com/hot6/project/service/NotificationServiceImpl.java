package com.hot6.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hot6.project.dao.NotificationDAO;
import com.hot6.project.vo.NotificationVO;

@Service
public class NotificationServiceImpl implements NotificationService{
	@Inject
	NotificationDAO dao;

	@Override
	public void insertNotification(NotificationVO notification) {
		dao.insertNotification(notification);
	}

	@Override
	public List<NotificationVO> selectNotifications(String receiver_id) {
		return dao.selectNotifications(receiver_id);
	}

	@Override
	public List<NotificationVO> selectCurNotifications(String receiver_id) {
		return dao.selectCurNotifications(receiver_id);
	}

	@Override
	public void updateRead(int notification_id) {
		dao.updateRead(notification_id);
	}

	@Override
	public int countNotRead(String receiver_id) {
		return dao.countNotRead(receiver_id);
	}

	@Override
	public String selectReceiverid(int notification_id) {
		return dao.selectReceiverid(notification_id);
	}

	@Override
	public void deleteNotification(int notification_id) {
		dao.deleteNotification(notification_id);
	}

}
