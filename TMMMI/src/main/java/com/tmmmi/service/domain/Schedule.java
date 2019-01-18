package com.tmmmi.service.domain;

import java.sql.Date;

public class Schedule {

	private int scheduleNo;
	private int userNo;
	private int userCategoryNo;
	private String scheduleTitle;
	private String scheduleDetail;
	private String scheduleLocation;
	private long scheduleStartDate;
	private long scheduleEndDate;
	private int goingDuration;
	private int comingDuration;
	private int isScheduleDDay;
	private int markDDay; //0='D-Day', 1='D+Day';
	private int isScheduleImportant;
	private int scheduleAlarmTime; //�� ��
	
	public Schedule() {
		
	}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
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

	public String getScheduleLocation() {
		return scheduleLocation;
	}

	public void setScheduleLocation(String scheduleLocation) {
		this.scheduleLocation = scheduleLocation;
	}

	public long getScheduleStartDate() {
		return scheduleStartDate;
	}

	public void setScheduleStartDate(long scheduleStartDate) {
		this.scheduleStartDate = scheduleStartDate;
	}

	public long getScheduleEndDate() {
		return scheduleEndDate;
	}

	public void setScheduleEndDate(long scheduleEndDate) {
		this.scheduleEndDate = scheduleEndDate;
	}

	public int getGoingDuration() {
		return goingDuration;
	}

	public void setGoingDuration(int goingDuration) {
		this.goingDuration = goingDuration;
	}

	public int getComingDuration() {
		return comingDuration;
	}

	public void setComingDuration(int comingDuration) {
		this.comingDuration = comingDuration;
	}

	public int getIsScheduleDDay() {
		return isScheduleDDay;
	}

	public void setIsScheduleDDay(int isScheduleDDay) {
		this.isScheduleDDay = isScheduleDDay;
	}

	public int getMarkDDay() {
		return markDDay;
	}

	public void setMarkDDay(int markDDay) {
		this.markDDay = markDDay;
	}

	public int getIsScheduleImportant() {
		return isScheduleImportant;
	}

	public void setIsScheduleImportant(int isScheduleImportant) {
		this.isScheduleImportant = isScheduleImportant;
	}

	public int getScheduleAlarmTime() {
		return scheduleAlarmTime;
	}

	public void setScheduleAlarmTime(int scheduleAlarmTime) {
		this.scheduleAlarmTime = scheduleAlarmTime;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Schedule [scheduleNo=");
		builder.append(scheduleNo);
		builder.append(", userNo=");
		builder.append(userNo);
		builder.append(", userCategoryNo=");
		builder.append(userCategoryNo);
		builder.append(", scheduleTitle=");
		builder.append(scheduleTitle);
		builder.append(", scheduleDetail=");
		builder.append(scheduleDetail);
		builder.append(", scheduleLocation=");
		builder.append(scheduleLocation);
		builder.append(", scheduleStartDate=");
		builder.append(scheduleStartDate);
		builder.append(", scheduleEndDate=");
		builder.append(scheduleEndDate);
		builder.append(", goingDuration=");
		builder.append(goingDuration);
		builder.append(", comingDuration=");
		builder.append(comingDuration);
		builder.append(", isScheduleDDay=");
		builder.append(isScheduleDDay);
		builder.append(", markDDay=");
		builder.append(markDDay);
		builder.append(", isScheduleImportant=");
		builder.append(isScheduleImportant);
		builder.append(", scheduleAlarmTime=");
		builder.append(scheduleAlarmTime);
		builder.append("]");
		return builder.toString();
	}
		
}
