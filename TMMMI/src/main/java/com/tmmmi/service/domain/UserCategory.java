package com.tmmmi.service.domain;

public class UserCategory {

	private int userNo;
	private int userCategoryNo;
	private String userCategoryTitle;
	private String userCategoryColor;
	
	public UserCategory() {
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

	public String getUserCategoryTitle() {
		return userCategoryTitle;
	}

	public void setUserCategoryTitle(String userCategoryTitle) {
		this.userCategoryTitle = userCategoryTitle;
	}

	public String getUserCategoryColor() {
		return userCategoryColor;
	}

	public void setUserCategoryColor(String userCategoryColor) {
		this.userCategoryColor = userCategoryColor;
	}
}
