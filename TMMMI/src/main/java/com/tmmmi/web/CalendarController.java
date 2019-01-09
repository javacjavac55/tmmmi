package com.tmmmi.web;

import java.sql.Date;

import com.tmmmi.service.calendarmovie.CalendarMovieService;
import com.tmmmi.service.calendarsetting.CalendarSettingService;
import com.tmmmi.service.calendarsport.CalendarSportService;
import com.tmmmi.service.dday.DDayService;
import com.tmmmi.service.schedule.ScheduleService;
import com.tmmmi.service.usercategory.UserCategoryService;
import com.tmmmi.service.usersetting.UserSettingService;

public class CalendarController {
	
	private Date targetDate;
	private CalendarSettingService calendarSettingService;
	private UserSettingService userSettingService;
	private UserCategoryService userCategoryService;
	private ScheduleService scheduleService;
	private DDayService dDayService;
	private CalendarMovieService calendarMovieService;
	private CalendarSportService calendarSportService;
	
	public CalendarController() {
		// TODO Auto-generated constructor stub
	}
	
	public void getCalendarSetting() {}
	public void getUserSetting() {}
	public void getUserCategoryList() {}
	public void getScheduleList() {}
	public void getFrequentScheduleList() {}
	public void getImportantScheduleList() {}
	public void DDayList() {}
	public void getCalendarMovieList() {}
	public void getCalendarSportList() {}
	public void getCalendarMonth() {}
	public void getCalendarWeek() {}
	public void getCalendarDay() {}

}
