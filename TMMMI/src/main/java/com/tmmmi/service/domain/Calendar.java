package com.tmmmi.service.domain;

import java.util.List;

public class Calendar {
	
	private UserSetting userSetting;
	private CalendarSetting calendarSetting;
	private List<Schedule> scheduleList;
	private List<UserCategory> userCategoryList;
	private List<DDay> dDayList;
	private List<CalendarMovie> calendarMovieList;
	private List<CalendarSport> calendarSportList;

	public Calendar() {
	}

	public UserSetting getUserSetting() {
		return userSetting;
	}

	public void setUserSetting(UserSetting userSetting) {
		this.userSetting = userSetting;
	}

	public CalendarSetting getCalendarSetting() {
		return calendarSetting;
	}

	public void setCalendarSetting(CalendarSetting calendarSetting) {
		this.calendarSetting = calendarSetting;
	}

	public List<Schedule> getScheduleList() {
		return scheduleList;
	}

	public void setScheduleList(List<Schedule> scheduleList) {
		this.scheduleList = scheduleList;
	}

	public List<UserCategory> getUserCategoryList() {
		return userCategoryList;
	}

	public void setUserCategoryList(List<UserCategory> userCategoryList) {
		this.userCategoryList = userCategoryList;
	}

	public List<DDay> getdDayList() {
		return dDayList;
	}

	public void setdDayList(List<DDay> dDayList) {
		this.dDayList = dDayList;
	}

	public List<CalendarMovie> getCalendarMovieList() {
		return calendarMovieList;
	}

	public void setCalendarMovieList(List<CalendarMovie> calendarMovieList) {
		this.calendarMovieList = calendarMovieList;
	}

	public List<CalendarSport> getCalendarSportList() {
		return calendarSportList;
	}

	public void setCalendarSportList(List<CalendarSport> calendarSportList) {
		this.calendarSportList = calendarSportList;
	}

}
