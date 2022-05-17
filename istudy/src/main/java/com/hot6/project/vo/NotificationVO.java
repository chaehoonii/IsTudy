package com.hot6.project.vo;

public class NotificationVO {
	private int notification_num;
	private String receiver_id;
	private String sendtime;
	private String content;
	private boolean isread;
	
	
	
	public int getNotification_num() {
		return notification_num;
	}
	public void setNotification_num(int notification_num) {
		this.notification_num = notification_num;
	}
	public String getReceiver_id() {
		return receiver_id;
	}
	public void setReceiver_id(String receiver_id) {
		this.receiver_id = receiver_id;
	}
	public String getSendtime() {
		return sendtime;
	}
	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public boolean isIsread() {
		return isread;
	}
	public void setIsread(boolean isread) {
		this.isread = isread;
	}
	
	
}
