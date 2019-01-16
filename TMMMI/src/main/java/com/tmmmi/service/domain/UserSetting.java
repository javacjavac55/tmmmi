package com.tmmmi.service.domain;

public class UserSetting {
	
	private int userNo;
	private int userSettingNo;
	private int mainColorModeNo;
	private String menuBackgroundColor;
	private String menuFontColor;
	private int showScrapAlarm;
	private String scrapAlarmTime;
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getUserSettingNo() {
		return userSettingNo;
	}
	public void setUserSettingNo(int userSettingNo) {
		this.userSettingNo = userSettingNo;
	}
	public int getMainColorModeNo() {
		return mainColorModeNo;
	}
	public void setMainColorModeNo(int mainColorModeNo) {
		this.mainColorModeNo = mainColorModeNo;
	}
	public String getMenuBackgroundColor() {
		return menuBackgroundColor;
	}
	public void setMenuBackgroundColor(String menuBackgroundColor) {
		this.menuBackgroundColor = menuBackgroundColor;
	}
	public String getMenuFontColor() {
		return menuFontColor;
	}
	public void setMenuFontColor(String menuFontColor) {
		this.menuFontColor = menuFontColor;
	}
	public int getShowScrapAlarm() {
		return showScrapAlarm;
	}
	public void setShowScrapAlarm(int showScrapAlarm) {
		this.showScrapAlarm = showScrapAlarm;
	}
	public String getScrapAlarmTime() {
		return scrapAlarmTime;
	}
	public void setScrapAlarmTime(String scrapAlarmTime) {
		this.scrapAlarmTime = scrapAlarmTime;
	}
	
	@Override
	public String toString() {
		return "UserSetting [userNo=" + userNo + ", userSettingNo=" + userSettingNo + ", mainColorModeNo="
				+ mainColorModeNo + ", menuBackgroundColor=" + menuBackgroundColor + ", menuFontColor=" + menuFontColor
				+ ", showScrapAlarm=" + showScrapAlarm + ", scrapAlarmTime=" + scrapAlarmTime + ", getUserNo()="
				+ getUserNo() + ", getUserSettingNo()=" + getUserSettingNo() + ", getMainColorModeNo()="
				+ getMainColorModeNo() + ", getMenuBackgroundColor()=" + getMenuBackgroundColor()
				+ ", getMenuFontColor()=" + getMenuFontColor() + ", getShowScrapAlarm()=" + getShowScrapAlarm()
				+ ", getScrapAlarmTime()=" + getScrapAlarmTime() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
