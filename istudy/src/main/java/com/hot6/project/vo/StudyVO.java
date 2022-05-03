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
	
	//study_mate
	private int want_num;
	private String user_id;
	private String want_ok;
	
	//calendar
	private String plan_name;
	private String plan_detail;
	private String plan_start;
	private String plan_finish;
	
	//hashtag
	private String tag1;
	private String tag2;
	private String tag3;
	private String tag4;
	private String tag5;
		
}
