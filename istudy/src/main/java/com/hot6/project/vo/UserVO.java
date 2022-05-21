package com.hot6.project.vo;

import java.util.List;

public class UserVO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_nick;
	private String email;
	private String tel;

	private String register_date;
	private int exp;
	private String profile_img; 
	private String permission;
	private String study_type_num;
	private String want;
	private String career;
	private String career_year;
	
	private int exp_min;
	private int exp_max;
	private int level;
	private String level_icon;
	
	private String leave_date;
	private String is_forced;
	private String leave_type_name;
	private String leave_detail;
	private int leave_type_num;
	private List<String> userList;
	

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	public int getExp() {
		return exp;
	}
	public void setExp(int exp) {
		this.exp = exp;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public String getStudy_type_num() {
		return study_type_num;
	}
	public void setStudy_type_num(String study_type_num) {
		this.study_type_num = study_type_num;
	}
	public String getWant() {
		return want;
	}
	public void setWant(String want) {
		this.want = want;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public int getExp_min() {
		return exp_min;
	}
	public void setExp_min(int exp_min) {
		this.exp_min = exp_min;
	}
	public int getExp_max() {
		return exp_max;
	}
	public void setExp_max(int exp_max) {
		this.exp_max = exp_max;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getLevel_icon() {
		return level_icon;
	}
	public void setLevel_icon(String level_icon) {
		this.level_icon = level_icon;
	}
	public String getLeave_date() {
		return leave_date;
	}
	public void setLeave_date(String leave_date) {
		this.leave_date = leave_date;
	}
	public String getCareer_year() {
		return career_year;
	}
	public void setCareer_year(String career_year) {
		this.career_year = career_year;
	}
	public String getIs_forced() {
		return is_forced;
	}
	public void setIs_forced(String is_forced) {
		this.is_forced = is_forced;
	}
	public String getLeave_type_name() {
		return leave_type_name;
	}
	public void setLeave_type_name(String leave_type_name) {
		this.leave_type_name = leave_type_name;
	}
	public String getLeave_detail() {
		return leave_detail;
	}
	public void setLeave_detail(String leave_detail) {
		this.leave_detail = leave_detail;
	}
	public int getLeave_type_num() {
		return leave_type_num;
	}
	public void setLeave_type_num(int leave_type_num) {
		this.leave_type_num = leave_type_num;
	}
	public List<String> getUserList() {
		return userList;
	}
	public void setUserList(List<String> userList) {
		this.userList = userList;
	}
	


}