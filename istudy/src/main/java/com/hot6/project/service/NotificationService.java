package com.hot6.project.service;

import java.util.List;

import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.NotificationVO;
import com.hot6.project.vo.StudyVO;

public interface NotificationService {
	public void insertNotification(NotificationVO notification);
	public List<NotificationVO> selectNotifications(String receiver_id);
	public List<NotificationVO> selectCurNotifications(String receiver_id);
	public void updateRead(int notification_id);
	public int countNotRead(String receiver_id);
	public String selectReceiverid(int notification_id);
	public void deleteNotification(int notification_id);
}
