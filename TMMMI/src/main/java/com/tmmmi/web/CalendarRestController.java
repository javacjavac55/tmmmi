package com.tmmmi.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tmmmi.service.dday.DDayService;
import com.tmmmi.service.domain.UserCategory;
import com.tmmmi.service.schedule.ScheduleService;
import com.tmmmi.service.usercategory.UserCategoryService;

@RestController
@RequestMapping("/calendarRest/*")
public class CalendarRestController {
	
	private ScheduleService scheduleService;

	@Autowired
	@Qualifier("userCategoryServiceImpl")
	private UserCategoryService userCategoryService;
	private DDayService dDayService;

	public CalendarRestController() {
		System.out.println(this.getClass());
	}
	
	public void addSchedule() {}
	public void updateSchedule() {}
	public void deleteSchedule() {}
	
	@RequestMapping( value="addUserCategory", method=RequestMethod.POST )
	public int addUserCategory(@RequestBody UserCategory userCategory) {
		System.out.println("/addUserCategory.do");
		
		System.out.println("userCategory: "+userCategory);
		int result = userCategoryService.addUserCategory(userCategory);
		System.out.println("addUserCategory result: "+result);
	
		
		return result;
	}
	public void updateUserCategory() {}
	public void deleteUserCategory() {}
	public void addDDay() {}
	public void updateDDay() {}
	public void deleteDDay() {}
	
}
