package com.tmmmi.service.domain;

import java.sql.Date;

public class Schedule {

	private int userNo;
	private int scheduleNo;
	private int userCategoryNo;
	private String scheduleTitle;
	private String scheduleDetail;
	private Date scheduleStartDate;
	private Date scheduleEndDate;
	private String scheduleLocationX;
	private String scheduleLocationY;
	private boolean scheduleFrequent;
	private boolean scheduleImportant;
	private Date scheduleAlarmTime;
	
	public Schedule() {
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	public int getUserCategoryNo() {
		return userCategoryNo;
	}

	public void setUserCategoryNo(int userCategoryNo) {
		this.userCategoryNo = userCategoryNo;
	}

	public String getScheduleTitle() {
		return scheduleTitle;
	}

	public void setScheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}

	public String getScheduleDetail() {
		return scheduleDetail;
	}

	public void setScheduleDetail(String scheduleDetail) {
		this.scheduleDetail = scheduleDetail;
	}

	public Date getScheduleStartDate() {
		return scheduleStartDate;
	}

	public void setScheduleStartDate(Date scheduleStartDate) {
		this.scheduleStartDate = scheduleStartDate;
	}

	public Date getScheduleEndDate() {
		return scheduleEndDate;
	}

	public void setScheduleEndDate(Date scheduleEndDate) {
		this.scheduleEndDate = scheduleEndDate;
	}

	public String getScheduleLocationX() {
		return scheduleLocationX;
	}

	public void setScheduleLocationX(String scheduleLocationX) {
		this.scheduleLocationX = scheduleLocationX;
	}

	public String getScheduleLocationY() {
		return scheduleLocationY;
	}

	public void setScheduleLocationY(String scheduleLocationY) {
		this.scheduleLocationY = scheduleLocationY;
	}

	public boolean isScheduleFrequent() {
		return scheduleFrequent;
	}

	public void setScheduleFrequent(boolean scheduleFrequent) {
		this.scheduleFrequent = scheduleFrequent;
	}

	public boolean isScheduleImportant() {
		return scheduleImportant;
	}

	public void setScheduleImportant(boolean scheduleImportant) {
		this.scheduleImportant = scheduleImportant;
	}

	public Date getScheduleAlarmTime() {
		return scheduleAlarmTime;
	}

	public void setScheduleAlarmTime(Date scheduleAlarmTime) {
		this.scheduleAlarmTime = scheduleAlarmTime;
	}
	
}
