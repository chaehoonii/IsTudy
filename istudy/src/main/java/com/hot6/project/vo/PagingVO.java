package com.hot6.project.vo;

import java.util.List;

public class PagingVO {
	//페이징
	private int onePageRecord = 10;//한페이지당 출력할 레코드 수
	private int studyOnePageRecord = 4;	//스터디 페이지 출력할 레코드 수
	private int pageNum = 1;//현재페이지
	private int studyPageNum = 1;//스터디 현재페이지
	private int totalRecord;//총 레코드의 수
	private int studyTotalRecord;//총 스터디 레코드의 수
	private int totalPage;//총 페이지 수
	private int studyTotalPage;//총 스터디 페이지 수
	private int offsetIndex = 0;
	private int onePageCount = 10;//한번에 표시할 페이지 수
	private int startPage = 1;
	//검색
	private String searchKey;
	private String searchWord;
	
	private List<String> sclass;
	private List<String> stype;
	/* private List<String> sstatus; */
	 private String status;
	
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	
	public int getStudyOnePageRecord() {
		return studyOnePageRecord;
	}
	public void setStudyOnePageRecord(int studyOnePageRecord) {
		this.studyOnePageRecord = studyOnePageRecord;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		offsetIndex = (pageNum-1)*onePageRecord;
		startPage = ((pageNum-1)/onePageCount*onePageCount)+1;
	}
	public int getStudyPageNum() {
		return studyPageNum; 
	}
	public void setStudyPageNum(int studyPageNum) {
		this.studyPageNum = studyPageNum;
		offsetIndex = (studyPageNum-1)*studyOnePageRecord;
		startPage = ((studyPageNum-1)/onePageCount*onePageCount)+1;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		if(totalRecord%onePageRecord==0) {
			totalPage = totalRecord/onePageRecord;
		}else {
			totalPage = totalRecord/onePageRecord+1;
		}
	}
	public int getStudyTotalRecord() {
		return studyTotalRecord;
	}
	public void setStudyTotalRecord(int studyTotalRecord) {
		this.studyTotalRecord = studyTotalRecord;
		
		if(studyTotalRecord%studyOnePageRecord==0) {
			studyTotalPage = studyTotalRecord/studyOnePageRecord;
		}else {
			studyTotalPage = studyTotalRecord/studyOnePageRecord+1;
		}
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStudyTotalPage() {
		return studyTotalPage;
	}
	public void setStudyTotalPage(int studyTotalPage) {
		this.studyTotalPage = studyTotalPage;
	}
	public int getOffsetIndex() {
		return offsetIndex;
	}
	public void setOffsetIndex(int pageNum, int onePageRecord) {
		this.offsetIndex = (pageNum-1)*onePageRecord;
	}
	public int getOnePageCount() {
		return onePageCount;
	}
	public void setOnePageCount(int onePageCount) {
		this.onePageCount = onePageCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public List<String> getSclass() {
		return sclass;
	}
	public void setSclass(List<String> sclass) {
		System.out.println(":>>>"+sclass);
		this.sclass = sclass;
	}
	public List<String> getStype() {
		return stype;
	}
	public void setStype(List<String> stype) {
		this.stype = stype;
	}
	
	/*
	 * public List<String> getSstatus() { return sstatus; } public void
	 * setSstatus(List<String> sstatus) { this.sstatus = sstatus;
	 * System.out.println("sstatus======"); for(String st: sstatus) {
	 * System.out.println(st); } }
	 */
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
		

}
