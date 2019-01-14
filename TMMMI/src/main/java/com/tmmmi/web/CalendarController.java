package com.tmmmi.web;

import java.sql.Date;
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
	
	/*@Autowired
	@Qualifier("scheduleServiceImpl")*/
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
		/*int userNo = ((User)session.getAttribute("user")).getUserNo();*/
		int userNo = 12345;
		
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
	public ModelAndView getCalendarMonth() {
		int userNo = 12345;
		List<UserCategory> userCategoryList = userCategoryService.getUserCategoryList(userNo);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userCategoryList", userCategoryList);
		modelAndView.setViewName("/calendar/getCalendarMonth.jsp");
		
		return modelAndView;
	}
	public void getCalendarWeek() {}
	public void getCalendarDay() {}

}
