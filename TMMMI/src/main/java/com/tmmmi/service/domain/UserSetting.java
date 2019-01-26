package com.tmmmi.service.domain;

public class UserSetting {
	
	private int userNo;
	private int userSettingNo;
	private int mainColorModeNo;
	private String menuFontColor;
	private int showScrapAlarm;
	private String scrapAlarmTime;
	private String image;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	@Override
	public String toString() {
		return "UserSetting [userNo=" + userNo + ", userSettingNo=" + userSettingNo + ", mainColorModeNo="
				+ mainColorModeNo + ", menuFontColor=" + menuFontColor + ", showScrapAlarm=" + showScrapAlarm
				+ ", scrapAlarmTime=" + scrapAlarmTime + ", image=" + image + "]";
	}
	
}
