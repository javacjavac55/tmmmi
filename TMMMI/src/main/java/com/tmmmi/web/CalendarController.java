package com.tmmmi.web;

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
import com.tmmmi.service.domain.DDay;
import com.tmmmi.service.domain.Schedule;
import com.tmmmi.service.domain.UserCategory;
import com.tmmmi.service.schedule.ScheduleService;
import com.tmmmi.service.usercategory.UserCategoryService;

@Controller
@RequestMapping("/calendar/*")
public class CalendarController {	
	@Autowired
	@Qualifier("calendarSettingServiceImpl")
	private CalendarSettingService calendarSettingService;
		
	@Autowired
	@Qualifier("userCategoryServiceImpl")
	private UserCategoryService userCategoryService;
	
	@Autowired
	@Qualifier("scheduleServiceImpl")
	private ScheduleService scheduleService;
		
	@Autowired
	@Qualifier("calendarMovieServiceImpl")
	private CalendarMovieService calendarMovieService;
	
	@Autowired
	@Qualifier("calendarSportServiceImpl")
	private CalendarSportService calendarSportService;
	
	public CalendarController() {
		
	}
	
	public void getCalendarSetting() {}
	public void getUserSetting() {}
	
	@RequestMapping(value="getUserCategoryList", method=RequestMethod.GET)
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
		//set startDate, endDate with current month
		ModelAndView modelAndView = new ModelAndView();
		
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.DATE, 1);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
	    calendar.set(Calendar.MINUTE, 0);
	    calendar.set(Calendar.SECOND, 0);
	    calendar.set(Calendar.MILLISECOND, 0);
		long startDate = calendar.getTimeInMillis();
		
		calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		calendar.set(Calendar.HOUR_OF_DAY, 23);
	    calendar.set(Calendar.MINUTE, 59);
	    calendar.set(Calendar.SECOND, 59);
	    calendar.set(Calendar.MILLISECOND, 999);
		long endDate = calendar.getTimeInMillis();
		
		System.out.println("startDate: "+startDate);
		System.out.println("endDate: "+endDate);
		
		int userNo = (int)session.getAttribute("userNo");
		List<UserCategory> userCategoryList = userCategoryService.getUserCategoryList(userNo);

		/*//카테고리가 없으면
		if (userCategoryList == null || userCategoryList.size() == 0) {
			System.out.println("12345");
			modelAndView.setViewName("/calendar/getUserCategoryList/");
			return modelAndView;
		}*/
		
		List<Schedule> scheduleList = scheduleService.getScheduleList(userNo,startDate,endDate);
		
		modelAndView.addObject("userCategoryList", userCategoryList);
		modelAndView.addObject("scheduleList", scheduleList);
		modelAndView.setViewName("/calendar/getCalendarMonth.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="getImportantDday", method=RequestMethod.GET)
	public ModelAndView getImportantDday(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, 0);
	    calendar.set(Calendar.MINUTE, 0);
	    calendar.set(Calendar.SECOND, 0);
	    calendar.set(Calendar.MILLISECOND, 0);
	    long startToday = calendar.getTimeInMillis();
		calendar.set(Calendar.HOUR_OF_DAY, 23);
	    calendar.set(Calendar.MINUTE, 59);
	    calendar.set(Calendar.SECOND, 59);
	    calendar.set(Calendar.MILLISECOND, 999);
		long endToday = calendar.getTimeInMillis();
		
		int userNo = (int)session.getAttribute("userNo");
		
		List<Schedule> importantScheduleList = scheduleService.getImportantScheduleList(userNo,startToday,endToday);
		List<DDay> dDayScheduleList = scheduleService.getDDayScheduleList(userNo,startToday,endToday);

		System.out.println("startToday: "+startToday);
		System.out.println("endToday: "+endToday);
		modelAndView.addObject("importantScheduleList",importantScheduleList);
		modelAndView.addObject("dDayScheduleList",dDayScheduleList);
		modelAndView.setViewName("/calendar/importantDDay.jsp");
		
		return modelAndView;
	}
	
	public void getCalendarWeek() {}
	public void getCalendarDay() {}
	
	@RequestMapping(value="getCalendarInterest", method=RequestMethod.GET)
	public ModelAndView getCalendarInterest() throws Exception{
		long startDate = 0;
		long endDate = 0;
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.DATE, 1);
		startDate = calendar.getTime().getTime();
		calendar.set(Calendar.DATE, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		endDate = calendar.getTime().getTime();
		
		List<UserCategory> interestCategoryList = userCategoryService.getInterestCategoryList();
		List<Schedule> calendarMovieList = calendarMovieService.getCalendarMovieList(startDate,endDate);
		List<Schedule> calendarSportList = calendarSportService.getCalendarSportList(startDate, endDate);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("interestCategoryList", interestCategoryList);
		modelAndView.addObject("calendarMovieList", calendarMovieList);
		modelAndView.addObject("calendarSportList", calendarSportList);
		modelAndView.setViewName("/calendar/getCalendarInterest.jsp");
		return modelAndView;
	}
	
}
