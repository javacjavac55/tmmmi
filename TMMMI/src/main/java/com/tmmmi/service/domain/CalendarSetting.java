package com.tmmmi.service.domain;

public class CalendarSetting {
	
	private int userNo;
	private int calendarSettingNo;
	private int mainCalendarType;
	private int calendarStartDay;
	private int showMovie;
	private int showSportOverseaSoccer;
	private int showSportSoccer;
	private int showSportOverseaBaseball;
	private int showSportBaseball;
	private int showSportOverseaBasketball;
	private int showSportBasketball;
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getCalendarSettingNo() {
		return calendarSettingNo;
	}
	public void setCalendarSettingNo(int calendarSettingNo) {
		this.calendarSettingNo = calendarSettingNo;
	}
	public int getMainCalendarType() {
		return mainCalendarType;
	}
	public void setMainCalendarType(int mainCalendarType) {
		this.mainCalendarType = mainCalendarType;
	}
	public int getCalendarStartDay() {
		return calendarStartDay;
	}
	public void setCalendarStartDay(int calendarStartDay) {
		this.calendarStartDay = calendarStartDay;
	}
	public int getShowMovie() {
		return showMovie;
	}
	public void setShowMovie(int showMovie) {
		this.showMovie = showMovie;
	}
	public int getShowSportOverseaSoccer() {
		return showSportOverseaSoccer;
	}
	public void setShowSportOverseaSoccer(int showSportOverseaSoccer) {
		this.showSportOverseaSoccer = showSportOverseaSoccer;
	}
	public int getShowSportSoccer() {
		return showSportSoccer;
	}
	public void setShowSportSoccer(int showSportSoccer) {
		this.showSportSoccer = showSportSoccer;
	}
	public int getShowSportOverseaBaseball() {
		return showSportOverseaBaseball;
	}
	public void setShowSportOverseaBaseball(int showSportOverseaBaseball) {
		this.showSportOverseaBaseball = showSportOverseaBaseball;
	}
	public int getShowSportBaseball() {
		return showSportBaseball;
	}
	public void setShowSportBaseball(int showSportBaseball) {
		this.showSportBaseball = showSportBaseball;
	}
	public int getShowSportOverseaBasketball() {
		return showSportOverseaBasketball;
	}
	public void setShowSportOverseaBasketball(int showSportOverseaBasketball) {
		this.showSportOverseaBasketball = showSportOverseaBasketball;
	}
	public int getShowSportBasketball() {
		return showSportBasketball;
	}
	public void setShowSportBasketball(int showSportBasketball) {
		this.showSportBasketball = showSportBasketball;
	}
	
	@Override
	public String toString() {
		return "CalendarSetting [userNo=" + userNo + ", calendarSettingNo=" + calendarSettingNo + ", mainCalendarType="
				+ mainCalendarType + ", calendarStartDay=" + calendarStartDay + ", showMovie=" + showMovie
				+ ", showSportOverseaSoccer=" + showSportOverseaSoccer + ", showSportSoccer=" + showSportSoccer
				+ ", showSportOverseaBaseball=" + showSportOverseaBaseball + ", showSportBaseball=" + showSportBaseball
				+ ", showSportOverseaBasketball=" + showSportOverseaBasketball + ", showSportBasketball="
				+ showSportBasketball + "]";
	}

}
