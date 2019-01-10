package com.tmmmi.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;

import com.tmmmi.service.calendarsetting.CalendarSettingService;
import com.tmmmi.service.contentsetting.ContentSettingService;
import com.tmmmi.service.domain.User;
import com.tmmmi.service.user.UserService;
import com.tmmmi.service.usersetting.UserSettingService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
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
	public UserController() {
		System.out.println(this.getClass());
	}
	
	///Method
	@RequestMapping(value="addUser", method=RequestMethod.GET)
	public ModelAndView addUser() throws Exception {
		
		System.out.println("/user/addUser : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/user/addUser.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value="addUser", method=RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute("user") User user) throws Exception {
		
		System.out.println("/user/addUser : POST");
		
		userService.addUser(user);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/user/login.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="getUser", method=RequestMethod.GET)
	public ModelAndView getUser(@RequestParam("userNo") int userNo) throws Exception{
		
		System.out.println("/user/getUser : GET");
		User user = userService.getUser(userNo);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject(user);
		modelAndView.setViewName("/user/getUser.jsp");
		return modelAndView;
	}
	public void getUserList() {}
	public void updateUser() {}
	public void deleteUser() {}
	public void login() {}
	public void logout() {}
	
}
