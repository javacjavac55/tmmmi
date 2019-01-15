package com.tmmmi.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.common.Page;
import com.tmmmi.common.Search;
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
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
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
		modelAndView.setViewName("/user/login.jsp");
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
	
	
	@RequestMapping(value="getUserList")
	public ModelAndView getUserList(@ModelAttribute("search") Search search , @ModelAttribute("user") User user , HttpServletRequest request) throws Exception {
		
		System.out.println("/user/getUserList: GET");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ผ๖วเ
		Map<String , Object> map= userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("/user/listUser.jsp");
		
		return modelAndView;
	}
	
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
		
		int sessionId=((int)session.getAttribute("userNo"));
		if(sessionId == (user.getUserNo())){
			session.setAttribute("userNo", user.getUserNo());
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
