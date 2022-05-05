package com.hot6.project.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
	
	//calender_color
	private int color_num;
	private String color_name;
	
	//study_type
	private int study_type_num;
	private String study_type_name;
	
	//lang_type
	private int lang_type_num;
	private String lang_type_name;
	private String lang01;
	private String lang02;
	private String lang03;
	private String lang04;
	private String lang05;
	
	//study_mate
	private int want_num;
	private String user_id;
	private String want_ok;
	
	//calendar
	private String plan_num;
	private String plan_name;
	private String plan_detail;
	private String plan_start;
	private String plan_finish;
	private String start_time;
	private String finish_time;
	
	//hashtag
	private String tag1;
	private String tag2;
	private String tag3;
	private String tag4;
	private String tag5;
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
	public String getTag1() {
		return tag1;
	}
	public void setTag1(String tag1) {
		this.tag1 = tag1;
	}
	public String getTag2() {
		return tag2;
	}
	public void setTag2(String tag2) {
		this.tag2 = tag2;
	}
	public String getTag3() {
		return tag3;
	}
	public void setTag3(String tag3) {
		this.tag3 = tag3;
	}
	public String getTag4() {
		return tag4;
	}
	public void setTag4(String tag4) {
		this.tag4 = tag4;
	}
	public String getTag5() {
		return tag5;
	}
	public void setTag5(String tag5) {
		this.tag5 = tag5;
	}
		
}
