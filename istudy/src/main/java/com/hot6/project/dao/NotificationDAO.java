package com.hot6.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.hot6.project.vo.NotificationVO;

@Mapper
@Repository
public interface NotificationDAO {
	public void insertNotification(NotificationVO notification);
	public List<NotificationVO> selectNotifications(String receiver_id);
	public List<NotificationVO> selectCurNotifications(String receiver_id);
	public void updateRead(int notification_id);
	public int countNotRead(String receiver_id);
	public String selectReceiverid(int notification_id);
	public void deleteNotification(int notification_id);
}
