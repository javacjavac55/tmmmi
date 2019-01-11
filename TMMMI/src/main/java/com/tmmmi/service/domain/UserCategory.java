package com.tmmmi.service.domain;

public class UserCategory {

	private int userNo;
	private int userCategoryNo;
	private String userCategoryName;
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

	public String getUserCategoryName() {
		return userCategoryName;
	}

	public void setUserCategoryName(String userCategoryName) {
		this.userCategoryName = userCategoryName;
	}

	public String getUserCategoryColor() {
		return userCategoryColor;
	}

	public void setUserCategoryColor(String userCategoryColor) {
		this.userCategoryColor = userCategoryColor;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserCategory [userNo=");
		builder.append(userNo);
		builder.append(", userCategoryNo=");
		builder.append(userCategoryNo);
		builder.append(", userCategoryTitle=");
		builder.append(userCategoryName);
		builder.append(", userCategoryColor=");
		builder.append(userCategoryColor);
		builder.append("]");
		return builder.toString();
	}

}
