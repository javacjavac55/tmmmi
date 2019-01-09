package com.tmmmi.service.domain;

public class UserSetting {
	
	private int userNo;
	private int userSettingNo;
	private int mainColorMode;
	private String menuBackgroundColor;
	private String menuFontColor;
	private boolean showScrapAlarm;
	private String scrapAlarmTime;
	
	public UserSetting() {
	}

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

	public int getMainColorMode() {
		return mainColorMode;
	}

	public void setMainColorMode(int mainColorMode) {
		this.mainColorMode = mainColorMode;
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

	public boolean isShowScrapAlarm() {
		return showScrapAlarm;
	}

	public void setShowScrapAlarm(boolean showScrapAlarm) {
		this.showScrapAlarm = showScrapAlarm;
	}

	public String getScrapAlarmTime() {
		return scrapAlarmTime;
	}

	public void setScrapAlarmTime(String scrapAlarmTime) {
		this.scrapAlarmTime = scrapAlarmTime;
	}
}
