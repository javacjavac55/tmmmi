package com.tmmmi.service.domain;

import java.sql.Date;

public class ToDo {
	
	///Field
	private int toDoNo;
	private int userNo;
	private String toDoDetail;
	private Date toDoStartDate;
	private Date toDoEndDate;
	private int toDoCompleteNo;
	private Date toDoCompleteDate;
	
	
	///Constructor
	public ToDo() {
	}
	
	///Get/Set Method
	public int getToDoNo() {
		return toDoNo;
	}

	public void setToDoNo(int toDoNo) {
		this.toDoNo = toDoNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getToDoDetail() {
		return toDoDetail;
	}

	public void setToDoDetail(String toDoDetail) {
		this.toDoDetail = toDoDetail;
	}

	public Date getToDoStartDate() {
		return toDoStartDate;
	}

	public void setToDoStartDate(Date toDoStartDate) {
		this.toDoStartDate = toDoStartDate;
	}

	public Date getToDoEndDate() {
		return toDoEndDate;
	}

	public void setToDoEndDate(Date toDoEndDate) {
		this.toDoEndDate = toDoEndDate;
	}

	public int getToDoCompleteNo() {
		return toDoCompleteNo;
	}

	public void setToDoCompleteNo(int toDoCompleteNo) {
		this.toDoCompleteNo = toDoCompleteNo;
	}

	public Date getToDoCompleteDate() {
		return toDoCompleteDate;
	}

	public void setToDoCompleteDate(Date toDoCompleteDateList) {
		this.toDoCompleteDate = toDoCompleteDateList;
	}

	@Override
	public String toString() {
		return "ToDo [toDoNo=" + toDoNo + ", userNo=" + userNo + ", toDoDetail=" + toDoDetail + ", toDoStartDate="
				+ toDoStartDate + ", toDoEndDate=" + toDoEndDate + ", toDoCompleteNo=" + toDoCompleteNo
				+ ", toDoCompleteDate=" + toDoCompleteDate + "]";
	}
	
}
