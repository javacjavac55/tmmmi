package com.tmmmi.web;

import com.tmmmi.service.calendarsetting.CalendarSettingService;
import com.tmmmi.service.contentsetting.ContentSettingService;
import com.tmmmi.service.user.UserService;
import com.tmmmi.service.usersetting.UserSettingService;

public class UserRestController {
	
	private UserService userService;
	private CalendarSettingService calendarSettingService;
	private UserSettingService userSettingService;
	private ContentSettingService contentSettingService;

	public UserRestController() {
		// TODO Auto-generated constructor stub
	}
	
	public void login() {}
	public void logout() {}
	public void naverLogin() {}
	public void kakaoLogin() {}
	public void googleLogin() {}

}
