package com.hot6.project.vo;

import java.util.List;

public class StudyVO {
	//study_room
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
	private int in_people;	//현재 스터디원 수(select count)
	private int remain;	//남은 인원
	
	//calender_color
	private int color_num;
	private String color_name;
	
	//study_type
	private int study_type_num;
	private String study_type_name;
	
	//lang_type
	private int lang_type_num;
	private String lang_type_name;
	
	//study_mate
	private int want_num;
	private String user_id;
	private String want_ok;
	
	//calendar
	private int plan_num;
	private String plan_name;
	private String plan_detail;
	private String plan_start;
	private String plan_finish;
	private String start_time;
	private String finish_time;
	
	//study_hashtag
	private String tag;
	
	private List<String> lang_list;
	private List<String> tag_list;
	
	
	
	
	public List<String> getLang_list() {
		return lang_list;
	}
	public void setLang_list(List<String> lang_list) {
		this.lang_list = lang_list;
	}
	public List<String> getTag_list() {
		return tag_list;
	}
	public void setTag_list(List<String> tag_list) {
		this.tag_list = tag_list;
	}
	public int getIn_people() {
		return in_people;
	}
	public void setIn_people(int in_people) {
		this.in_people = in_people;
	}
	public int getRemain() {
		return remain;
	}
	public void setRemain(int remain) {
		this.remain = remain;
	}
	
	public int getPlan_num() {
		return plan_num;
	}
	public void setPlan_num(int plan_num) {
		this.plan_num = plan_num;
	}
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
	public int getColor_num() {
		return color_num;
	}
	public void setColor_num(int color_num) {
		this.color_num = color_num;
	}
	public String getColor_name() {
		return color_name;
	}
	public void setColor_name(String color_name) {
		this.color_name = color_name;
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
	public int getWant_num() {
		return want_num;
	}
	public void setWant_num(int want_num) {
		this.want_num = want_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getWant_ok() {
		return want_ok;
	}
	public void setWant_ok(String want_ok) {
		this.want_ok = want_ok;
	}
	public String getPlan_name() {
		return plan_name;
	}
	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}
	public String getPlan_detail() {
		return plan_detail;
	}
	public void setPlan_detail(String plan_detail) {
		this.plan_detail = plan_detail;
	}
	public String getPlan_start() {
		return plan_start;
	}
	public void setPlan_start(String plan_start) {
		this.plan_start = plan_start;
	}
	public String getPlan_finish() {
		return plan_finish;
	}
	public void setPlan_finish(String plan_finish) {
		this.plan_finish = plan_finish;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getFinish_time() {
		return finish_time;
	}
	public void setFinish_time(String finish_time) {
		this.finish_time = finish_time;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
}