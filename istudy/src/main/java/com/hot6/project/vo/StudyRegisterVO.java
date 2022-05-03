package com.hot6.project.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StudyRegisterVO {
	private int no;
	private String subject;
	private String content;
	private String userid;
	private String writedate;
	private String ip;
	private List<Integer> noList;
}
