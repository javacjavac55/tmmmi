package com.tmmmi.web;

import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tmmmi.service.dday.DDayService;
import com.tmmmi.service.domain.Schedule;
import com.tmmmi.service.domain.UserCategory;
import com.tmmmi.service.schedule.ScheduleService;
import com.tmmmi.service.usercategory.UserCategoryService;

@RestController
@RequestMapping("/calendarRest/*")
public class CalendarRestController {
	
	@Autowired
	@Qualifier("scheduleServiceImpl")
	private ScheduleService scheduleService;

	@Autowired
	@Qualifier("userCategoryServiceImpl")
	private UserCategoryService userCategoryService;

	public CalendarRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="addSchedule", method=RequestMethod.POST )
	public int addSchedule(@RequestBody Schedule schedule, HttpSession session) {
		System.out.println("/addSchedule.do");
		schedule.setUserNo((int)session.getAttribute("userNo"));
		System.out.println("schedule: "+schedule);
		int result = scheduleService.addSchedule(schedule);
		System.out.println("addSchedule result: "+result);
	
		
		return result;
	}
	
	@RequestMapping( value="getScheduleList", method=RequestMethod.POST )
	public int addSchedule(@RequestBody String targetDate, HttpSession session) {
		System.out.println("/getScheduleList.do");
		/*schedule.setUserNo((int)session.getAttribute("userNo"));
		System.out.println("schedule: "+schedule);
		int result = scheduleService.addSchedule(schedule);
		System.out.println("addSchedule result: "+result);*/
	
		System.out.println("targetDate: "+targetDate);
		
		return 0;
	}
	
	@RequestMapping( value="updateSchedule", method=RequestMethod.POST )
	public int updateSchedule(@RequestBody Schedule schedule, HttpSession session) {
		System.out.println("/updateSchedule.do");
		schedule.setUserNo((int)session.getAttribute("userNo"));
		System.out.println("schedule: "+schedule);
		int result = scheduleService.updateSchedule(schedule);
		System.out.println("updateSchedule result: "+result);
	
		return result;
	}
	
	@RequestMapping( value="deleteSchedule", method=RequestMethod.POST )
	public int deleteSchedule(@RequestBody Schedule schedule, HttpSession session) {
		System.out.println("/deleteSchedule.do");
		schedule.setUserNo((int)session.getAttribute("userNo"));
		System.out.println("schedule: "+schedule);
		int result = scheduleService.deleteSchedule(schedule);
		System.out.println("deleteSchedule result: "+result);
	
		return result;
	}
	
	@RequestMapping( value="addUserCategory", method=RequestMethod.POST )
	public int addUserCategory(@RequestBody UserCategory userCategory) {
		System.out.println("/addUserCategory.do");
		
		System.out.println("userCategory: "+userCategory);
		int result = userCategoryService.addUserCategory(userCategory);
		System.out.println("addUserCategory result: "+result);
	
		
		return result;
	}
	
	@RequestMapping( value="updateUserCategory", method=RequestMethod.POST )
	public int updateUserCategory(@RequestBody UserCategory userCategory) {
		System.out.println("/updateUserCategory : POST");
		
		System.out.println("userCategory: "+userCategory);
		int result = userCategoryService.updateUserCategory(userCategory);
		System.out.println("updateUserCategory result: "+result);	
		
		return result;
	}
	
	@RequestMapping( value="deleteUserCategory", method=RequestMethod.POST )
	public int deleteUserCategory(@RequestBody UserCategory userCategory) {
		System.out.println("/deleteUserCategory : POST");
		
		System.out.println("userCategory: "+userCategory);
		int result = userCategoryService.deleteUserCategory(userCategory);
		System.out.println("updateUserCategory result: "+result);	
		
		return result;
	}
	public void addDDay() {}
	public void updateDDay() {}
	public void deleteDDay() {}
	
}
