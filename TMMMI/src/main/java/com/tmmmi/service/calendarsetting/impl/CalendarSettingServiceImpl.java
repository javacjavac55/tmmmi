package com.tmmmi.service.calendarsetting.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tmmmi.service.calendarsetting.CalendarSettingDao;
import com.tmmmi.service.calendarsetting.CalendarSettingService;
import com.tmmmi.service.domain.CalendarSetting;

@Service("calendarSettingServiceImpl")
public class CalendarSettingServiceImpl implements CalendarSettingService {
	
	///Field
	@Autowired
	@Qualifier("calendarSettingDaoImpl")
	private CalendarSettingDao calendarSettingDao;
	public void setCalendarSettingDao(CalendarSettingDao calendarSettingDao) {
		this.calendarSettingDao = calendarSettingDao;
	}
	
	///Constructor
	public CalendarSettingServiceImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	@Override
	public void addCalendarSetting(CalendarSetting calendarSetting) {
		calendarSettingDao.addCalendarSetting(calendarSetting);
	}

	@Override
	public CalendarSetting getCalendarSetting(int userNo) {
		return calendarSettingDao.getCalendarSetting(userNo);
	}

	@Override
	public void updateCalendarSetting(CalendarSetting calendarSetting) {
		calendarSettingDao.updateCalendarSetting(calendarSetting);
	}

}
