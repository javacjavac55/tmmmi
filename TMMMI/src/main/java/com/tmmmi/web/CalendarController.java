package com.tmmmi.web;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.calendarmovie.CalendarMovieService;
import com.tmmmi.service.calendarsetting.CalendarSettingService;
import com.tmmmi.service.calendarsport.CalendarSportService;
import com.tmmmi.service.dday.DDayService;
import com.tmmmi.service.domain.Schedule;
import com.tmmmi.service.domain.UserCategory;
import com.tmmmi.service.schedule.ScheduleService;
import com.tmmmi.service.usercategory.UserCategoryService;
import com.tmmmi.service.usersetting.UserSettingService;

@Controller
@RequestMapping("/calendar/*")
public class CalendarController {
	
	private Date targetDate;
	
	/*@Autowired
	@Qualifier("calendarSettingServiceImpl")*/
	private CalendarSettingService calendarSettingService;
	
	/*@Autowired
	@Qualifier("userSettingServiceImpl")*/
	private UserSettingService userSettingService;
	
	@Autowired
	@Qualifier("userCategoryServiceImpl")
	private UserCategoryService userCategoryService;
	
	@Autowired
	@Qualifier("scheduleServiceImpl")
	private ScheduleService scheduleService;
	
	/*@Autowired
	@Qualifier("dDayServiceImpl")*/
	private DDayService dDayService;
	
	/*@Autowired
	@Qualifier("calendarMovieServiceImpl")*/
	private CalendarMovieService calendarMovieService;
	
	/*@Autowired
	@Qualifier("calendarSportServiceImpl")*/
	private CalendarSportService calendarSportService;
	
	public CalendarController() {
		
	}
	
	public void getCalendarSetting() {}
	public void getUserSetting() {}
	
	@RequestMapping(value="/getUserCategoryList", method=RequestMethod.GET)
	public ModelAndView getUserCategoryList(HttpSession session) {
		System.out.println("/getUserCategoryList : GET");
		int userNo = (int)session.getAttribute("userNo");
		
		List<UserCategory> userCategoryList = userCategoryService.getUserCategoryList(userNo);
		System.out.println("getUserCategoryList userCategoryList:"+userCategoryList);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userCategoryList", userCategoryList);
		modelAndView.setViewName("/calendar/listUserCategory.jsp");
		
		return modelAndView;
	}
	public void getScheduleList() {}
	public void getFrequentScheduleList() {}
	public void getImportantScheduleList() {}
	public void DDayList() {}
	public void getCalendarMovieList() {}
	public void getCalendarSportList() {}
	
	@RequestMapping(value="getCalendarMonth", method=RequestMethod.GET)
	public ModelAndView getCalendarMonth(HttpSession session) {
		int calendarType = 0;
		long startDate = 0;
		long endDate = 0;
		Calendar c = Calendar.getInstance();
		
		
		if (calendarType == 0) {
			c.set(Calendar.DATE, 1);
			startDate = c.getTime().getTime();
			c.set(Calendar.DATE, c.getActualMaximum(Calendar.DAY_OF_MONTH));
			endDate = c.getTime().getTime();
			
		}
		
		System.out.println("startDate: "+startDate);
		System.out.println("endDate: "+endDate);
		
		int userNo = (int)session.getAttribute("userNo");
		List<UserCategory> userCategoryList = userCategoryService.getUserCategoryList(userNo);
		List<Schedule> scheduleList = scheduleService.getScheduleList(userNo,startDate,endDate);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userCategoryList", userCategoryList);
		System.out.println(scheduleList.size());
		System.out.println(scheduleList);
		modelAndView.addObject("scheduleList", scheduleList);
		modelAndView.setViewName("/calendar/getCalendarMonth.jsp");
		
		return modelAndView;
	}
	public void getCalendarWeek() {}
	public void getCalendarDay() {}

}
