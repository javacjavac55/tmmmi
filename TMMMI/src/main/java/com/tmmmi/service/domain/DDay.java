package com.tmmmi.service.domain;

import java.sql.Date;

public class DDay {
	
	///Field
	private int userNo;
	private int dDayNo;
	private String dDayTitle;
	private Date dDayDate;
	private boolean showDPlusDay;
	private boolean showDMinusDay;
	
	///Constructor
	public DDay() {
		// TODO Auto-generated constructor stub
	}
	
	///Get/Set Method
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getdDayNo() {
		return dDayNo;
	}

	public void setdDayNo(int dDayNo) {
		this.dDayNo = dDayNo;
	}

	public String getdDayTitle() {
		return dDayTitle;
	}

	public void setdDayTitle(String dDayTitle) {
		this.dDayTitle = dDayTitle;
	}

	public Date getdDayDate() {
		return dDayDate;
	}

	public void setdDayDate(Date dDayDate) {
		this.dDayDate = dDayDate;
	}

	public boolean isShowDPlusDay() {
		return showDPlusDay;
	}

	public void setShowDPlusDay(boolean showDPlusDay) {
		this.showDPlusDay = showDPlusDay;
	}

	public boolean isShowDMinusDay() {
		return showDMinusDay;
	}

	public void setShowDMinusDay(boolean showDMinusDay) {
		this.showDMinusDay = showDMinusDay;
	}
	
}
