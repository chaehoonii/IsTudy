package com.hot6.project.vo;

import java.util.List;

public class BoardVO {
	//board
	private int board_num;
	private int study_num;
	private String user_id;
	private String title;
	private String content;
	private String writedate;
	private int hit;
	private int is_boardnotice;
	private String ip;
	private int count_reply;
	
	//board_type
	private int board_type_num;
	private String board_type_name;
	
	//board_image
	private String file1;
	private String file2;
	private String file3;
	private String file4;
	private String file5;
	
	//board_hashtag
	private String tag;

	private List<String> lang_list;
	private List<String> tag_list;
	
	//user
	private String user_nick;
	private String profile_img;
	
	
	public int getCount_reply() {
		return count_reply;
	}

	public void setCount_reply(int count_reply) {
		this.count_reply = count_reply;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

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

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getStudy_num() {
		return study_num;
	}

	public void setStudy_num(int study_num) {
		this.study_num = study_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getIs_boardnotice() {
		return is_boardnotice;
	}

	public void setIs_boardnotice(int is_boardnotice) {
		this.is_boardnotice = is_boardnotice;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getBoard_type_num() {
		return board_type_num;
	}

	public void setBoard_type_num(int board_type_num) {
		this.board_type_num = board_type_num;
	}

	public String getBoard_type_name() {
		return board_type_name;
	}

	public void setBoard_type_name(String board_type_name) {
		this.board_type_name = board_type_name;
	}

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	public String getFile2() {
		return file2;
	}

	public void setFile2(String file2) {
		this.file2 = file2;
	}

	public String getFile3() {
		return file3;
	}

	public void setFile3(String file3) {
		this.file3 = file3;
	}

	public String getFile4() {
		return file4;
	}

	public void setFile4(String file4) {
		this.file4 = file4;
	}

	public String getFile5() {
		return file5;
	}

	public void setFile5(String file5) {
		this.file5 = file5;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}
	
	
}