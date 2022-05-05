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
	private String tag01;
	private String tag02;
	private String tag03;
	private String tag04;
	private String tag05;
		
}
