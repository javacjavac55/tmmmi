package com.tmmmi.service.domain;

public class DDay {
	
	private int userNo;
	private int scheduleNo;
	private String userCategoryColor;
	private long targetDateStart;
	private long dDayStart;
	private String dDayTitle;
	private String markDDay;
	private int count;
	
	public DDay() {
		super();
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

	public String getUserCategoryColor() {
		return userCategoryColor;
	}

	public void setUserCategoryColor(String userCategoryColor) {
		this.userCategoryColor = userCategoryColor;
	}

	public long getTargetDateStart() {
		return targetDateStart;
	}

	public void setTargetDateStart(long targetDateStart) {
		this.targetDateStart = targetDateStart;
	}

	public String getdDayTitle() {
		return dDayTitle;
	}

	public void setdDayTitle(String dDayTitle) {
		this.dDayTitle = dDayTitle;
	}

	public String getMarkDDay() {
		return markDDay;
	}

	public void setMarkDDay(String markDDay) {
		this.markDDay = markDDay;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "DDay [userNo=" + userNo + ", scheduleNo=" + scheduleNo + ", userCategoryColor=" + userCategoryColor
				+ ", targetDateStart=" + targetDateStart + ", dDayTitle=" + dDayTitle + ", markDDay=" + markDDay
				+ ", count=" + count + "]";
	}

	public long getdDayStart() {
		return dDayStart;
	}

	public void setdDayStart(long dDayStart) {
		this.dDayStart = dDayStart;
	}
}
