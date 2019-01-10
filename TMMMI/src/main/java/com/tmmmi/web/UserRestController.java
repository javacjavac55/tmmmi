package com.tmmmi.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tmmmi.service.calendarsetting.CalendarSettingService;
import com.tmmmi.service.contentsetting.ContentSettingService;
import com.tmmmi.service.domain.User;
import com.tmmmi.service.user.UserService;
import com.tmmmi.service.usersetting.UserSettingService;

@RestController
@RequestMapping("/userRest/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	@Qualifier("calendarSettingServiceImpl")
	private CalendarSettingService calendarSettingService;
	@Qualifier("userSettingServiceImpl")
	private UserSettingService userSettingService;
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	///Constructor
	public UserRestController() {
		System.out.println(this.getClass());
	}
	
	///Method
	@RequestMapping( value="userRest/checkDuplication", method=RequestMethod.POST )
	public boolean checkDuplication(@RequestBody String userId ) throws Exception{
		
		userId = userId.replaceAll("\"", "");
		System.out.println(userId);
		System.out.println("/userRest/checkDuplication : POST");
		boolean result=userService.checkDuplication(userId);
		System.out.println(result);
		return result;	
	}
	
	public void naverLogin() {}
	public void kakaoLogin() {}
	public void googleLogin() {}

}
