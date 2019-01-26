package com.tmmmi.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.domain.UserSetting;
import com.tmmmi.service.usersetting.UserSettingService;

@Controller
@RequestMapping("/userSetting/*")
public class UserSettingController {
	///Field
	@Autowired
	@Qualifier("userSettingServiceImpl")
	private UserSettingService userSettingService;
	
	///Constructor
	public UserSettingController() {
		System.out.println(this.getClass());
	}
	
	///Method
	@RequestMapping(value="getUserSetting", method=RequestMethod.GET)
	public ModelAndView getUserSetting(HttpSession session) {
		System.out.println("/userSetting/getUserSetting : GET");
		
		int userNo = ((int)session.getAttribute("userNo"));
		UserSetting userSetting = userSettingService.getUserSetting(userNo);
		System.out.println(userSetting);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userSetting", userSetting);
		modelAndView.setViewName("/userSetting/getUserSetting.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="updateUserSetting", method=RequestMethod.GET)
	public ModelAndView updateUserSetting(HttpSession session) {
		System.out.println("/userSetting/updateUserSetting : GET");
		
		int userNo = ((int)session.getAttribute("userNo"));
		UserSetting userSetting = userSettingService.getUserSetting(userNo);
		System.out.println(userSetting);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userSetting", userSetting);
		modelAndView.setViewName("/userSetting/updateUserSetting.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="updateUserSetting", method=RequestMethod.POST)
	public ModelAndView updateUserSetting(@ModelAttribute("userSetting") UserSetting userSetting) {
		System.out.println("/userSetting/updateUserSetting : POST");
		
		userSettingService.updateUserSetting(userSetting);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/userSetting/getUserSetting.jsp");
		
		return modelAndView;
	}
}
