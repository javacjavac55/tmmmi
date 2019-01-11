package com.tmmmi.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		
		System.out.println("user/addUser : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/user/addUser.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value="addUser", method=RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute("user") User user) throws Exception {
		
		System.out.println("user/addUser : POST");
		
		userService.addUser(user);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/user/addUser.jsp");
		System.out.println(modelAndView);
		return modelAndView;
	}
	
	@RequestMapping(value="getUser", method=RequestMethod.GET)
	public ModelAndView getUser(@RequestParam("userNo") int userNo) throws Exception{
		
		System.out.println("/user/getUser : GET");
		User user = userService.getUser(userNo);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("user", user);
		modelAndView.setViewName("/user/getUser.jsp");
		System.out.println(modelAndView);
		
		return modelAndView;
	}
	
	public void getUserList() {}
	
	@RequestMapping(value="updateUser", method=RequestMethod.GET)
	public ModelAndView updateUser(@RequestParam("userNo") int userNo) throws Exception {
		System.out.println("/user/updateUser : GET");
		User user = userService.getUser(userNo);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("user", user);
		modelAndView.setViewName("/user/updateUser.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="updateUser", method=RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute("user") User user, HttpSession session) throws Exception {
		System.out.println("/user/updateUser : POST");
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/user/getUser?userNo="+user.getUserNo());
		return modelAndView;
	}
	public void deleteUser() {}
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public ModelAndView login() throws Exception{
		System.out.println("/user/login : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/user/login.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("user") User user, HttpSession session) throws Exception {
		System.out.println("/user/login : POST");
		User dbUser = userService.getUserId(user.getUserId());
		if(user.getPassword().equals(dbUser.getPassword())) {
			session.setAttribute("userNo", dbUser.getUserNo());
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/user/loginIndex.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public ModelAndView logout( HttpSession session ) throws Exception {
		System.out.println("/user/logout : GET");
		session.invalidate();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/user/login.jsp");
		return modelAndView;
	}
	
}
