package com.tmmmi.service.calendarsetting;

import com.tmmmi.service.domain.CalendarSetting;

public interface CalendarSettingDao {
	public void addCalendarSetting(CalendarSetting calendarSetting);
	public CalendarSetting getCalendarSetting(int userNo);
	public void updateCalendarSetting(CalendarSetting calendarSetting);
}
