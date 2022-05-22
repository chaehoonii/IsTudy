package com.hot6.project.vo;

public class AdminUserVO {

	private int board_num;
	private int report_num;
	private int report_type_num;
	private String user_id;
	private String report_content;
	private String report_time;
	private String title;
	private String writer;
	private String confirm;

	
	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	
	
	public int getReport_num() {
		return report_num;
	}

	public void setReport_num(int report_num) {
		this.report_num = report_num;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getReport_type_num() {
		return report_type_num;
	}

	public void setReport_type_num(int report_type_num) {
		this.report_type_num = report_type_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public String getReport_time() {
		return report_time;
	}

	public void setReport_time(String report_time) {
		this.report_time = report_time;
	}

	public String getReport_writing() {
		return title;
	}

	public void setReport_writing(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

}