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
	private String scheduleLocation;
	private int scheduleDDay;
	private int scheduleImportant;
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

	public String getScheduleLocation() {
		return scheduleLocation;
	}

	public void setScheduleLocation(String scheduleLocation) {
		this.scheduleLocation = scheduleLocation;
	}

	public int isScheduleDDay() {
		return scheduleDDay;
	}

	public void setScheduleDDay(int scheduleDDay) {
		this.scheduleDDay = scheduleDDay;
	}

	public int isScheduleImportant() {
		return scheduleImportant;
	}

	public void setScheduleImportant(int scheduleImportant) {
		this.scheduleImportant = scheduleImportant;
	}

	public Date getScheduleAlarmTime() {
		return scheduleAlarmTime;
	}

	public void setScheduleAlarmTime(Date scheduleAlarmTime) {
		this.scheduleAlarmTime = scheduleAlarmTime;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Schedule [userNo=");
		builder.append(userNo);
		builder.append(", scheduleNo=");
		builder.append(scheduleNo);
		builder.append(", userCategoryNo=");
		builder.append(userCategoryNo);
		builder.append(", scheduleTitle=");
		builder.append(scheduleTitle);
		builder.append(", scheduleDetail=");
		builder.append(scheduleDetail);
		builder.append(", scheduleStartDate=");
		builder.append(scheduleStartDate);
		builder.append(", scheduleEndDate=");
		builder.append(scheduleEndDate);
		builder.append(", scheduleLocation=");
		builder.append(scheduleLocation);
		builder.append(", scheduleDDay=");
		builder.append(scheduleDDay);
		builder.append(", scheduleImportant=");
		builder.append(scheduleImportant);
		builder.append(", scheduleAlarmTime=");
		builder.append(scheduleAlarmTime);
		builder.append("]");
		return builder.toString();
	}
	
}
