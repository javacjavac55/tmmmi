package com.tmmmi.service.domain;

import java.sql.Date;

public class Diary {
	
	private int diaryNo;
	private int userNo;
	private int userCategoryNo;
	private String diaryTitle;
	private String diaryDetail;
	private Date diaryDate;
	
	public Diary() {
		// TODO Auto-generated constructor stub
	}

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getUserCategoryNo() {
		return userCategoryNo;
	}

	public void setUserCategoryNo(int userCategoryNo) {
		this.userCategoryNo = userCategoryNo;
	}

	public String getDiaryTitle() {
		return diaryTitle;
	}

	public void setDiaryTitle(String diaryTitle) {
		this.diaryTitle = diaryTitle;
	}

	public String getDiaryDetail() {
		return diaryDetail;
	}

	public void setDiaryDetail(String diaryDetail) {
		this.diaryDetail = diaryDetail;
	}

	public Date getDiaryDate() {
		return diaryDate;
	}

	public void setDiaryDate(Date diaryDate) {
		this.diaryDate = diaryDate;
	}

}
