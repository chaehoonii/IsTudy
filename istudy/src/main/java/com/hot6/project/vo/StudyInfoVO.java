package com.hot6.project.vo;

import java.util.List;

public class StudyInfoVO {
	private int study_num;
	private String study_name;
	private String study_rule;
	private String study_img;
	private String study_write;
	private String study_write_date;
	private String start_date;
	private String finish_date;
	private String ip;
	private int max;
	private String host_id; 
	private String is_mentor;
	
	//study_type
	private int study_type_num;
	private String study_type_name;
	
	//lang_type
	private int lang_type_num;
	private String lang_type_name;
	
	private List<String> lang_type_name_list;
	
	public int getStudy_num() {
		return study_num;
	}
	public void setStudy_num(int study_num) {
		this.study_num = study_num;
	}
	public String getStudy_name() {
		return study_name;
	}
	public void setStudy_name(String study_name) {
		this.study_name = study_name;
	}
	public String getStudy_rule() {
		return study_rule;
	}
	public void setStudy_rule(String study_rule) {
		this.study_rule = study_rule;
	}
	public String getStudy_img() {
		return study_img;
	}
	public void setStudy_img(String study_img) {
		this.study_img = study_img;
	}
	public String getStudy_write() {
		return study_write;
	}
	public void setStudy_write(String study_write) {
		this.study_write = study_write;
	}
	public String getStudy_write_date() {
		return study_write_date;
	}
	public void setStudy_write_date(String study_write_date) {
		this.study_write_date = study_write_date;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getFinish_date() {
		return finish_date;
	}
	public void setFinish_date(String finish_date) {
		this.finish_date = finish_date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public String getHost_id() {
		return host_id;
	}
	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}
	public String getIs_mentor() {
		return is_mentor;
	}
	public void setIs_mentor(String is_mentor) {
		this.is_mentor = is_mentor;
	}
	public int getStudy_type_num() {
		return study_type_num;
	}
	public void setStudy_type_num(int study_type_num) {
		this.study_type_num = study_type_num;
	}
	public String getStudy_type_name() {
		return study_type_name;
	}
	public void setStudy_type_name(String study_type_name) {
		this.study_type_name = study_type_name;
	}
	public int getLang_type_num() {
		return lang_type_num;
	}
	public void setLang_type_num(int lang_type_num) {
		this.lang_type_num = lang_type_num;
	}
	public String getLang_type_name() {
		return lang_type_name;
	}
	public void setLang_type_name(String lang_type_name) {
		this.lang_type_name = lang_type_name;
	}
	public List<String> getLang_type_name_list() {
		return lang_type_name_list;
	}
	public void setLang_type_name_list(List<String> lang_type_name_list) {
		this.lang_type_name_list = lang_type_name_list;
	}

}
