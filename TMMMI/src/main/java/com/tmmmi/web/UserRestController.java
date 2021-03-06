package com.tmmmi.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
	@Autowired
	@Qualifier("calendarSettingServiceImpl")
	private CalendarSettingService calendarSettingService;
	@Autowired
	@Qualifier("userSettingServiceImpl")
	private UserSettingService userSettingService;
	@Autowired
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
		System.out.println("/userRest/checkDuplication : POST");
		boolean result=userService.checkDuplication(userId);
		System.out.println("result"+result);
		return result;	
	}
	
	@RequestMapping(value = "userRest/emailCheckDuplication", method=RequestMethod.POST)
	public boolean emailCheckDuplication(@RequestBody String email) {
		System.out.println("/userRest/emailCheckDuplication : POST");
		boolean result = userService.emailCheckDuplication(email);
		return result;
	}
	
	@RequestMapping(value = "userRest/authNumCheckDuplication", method=RequestMethod.POST)
	public boolean getAuthNumCheckDuplication(@RequestBody String authNum, HttpSession session) {
		System.out.println("/userRest/authNumCheckDuplication : POST");
	
		String sessionAuthNum = ((String)session.getAttribute("authNum"));
		authNum = authNum.replaceAll("\"", "");
		if(authNum.equals(sessionAuthNum)){
			System.out.println("sessionAuthNum : "+ sessionAuthNum);
			System.out.println("authNum : " + authNum);
			return true;
		}else {
			System.out.println("sessionAuthNum : "+ (String)session.getAttribute("authNum"));
			System.out.println("authNum : " + authNum);
			return false;
		}
	}
	
	@RequestMapping(value = "userRest/emailAuth", method = RequestMethod.POST )
	public boolean emailAuth(@RequestBody String email, HttpServletRequest request, HttpSession session, @ModelAttribute("user") User user) throws Exception {

		System.out.println("/userRest/emailAuth : POST");

		String inputEmail = email;
		String authNum = "";

		authNum = RandomNum();

		System.out.println("email==>" + inputEmail);
		System.out.println("authNum==> " + authNum);

		boolean result = userService.sendMail(email, authNum);

		session.setAttribute("authNum", authNum);
		System.out.println(session.getAttribute("authNum"));
		session.setAttribute("user", user);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/user/addUser.jsp");
		
		return result;
	}
	
	@RequestMapping(value="searchUserId", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView searchUserId() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/user/searchUserId.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="searchUserId", method=RequestMethod.POST)
	@ResponseBody
	public String searchUserId(@RequestBody User user) {
		
		System.out.println("/userRest/searchUserId");
		System.out.println(user);
		User searchUser = userService.searchUserId(user);
		String userId = searchUser.getUserId();
		String returnUserId = userId.substring(0, userId.length()-3);
		
		System.out.println("끝");
		
		return returnUserId	;
	}
	@RequestMapping(value="searchUserPw", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView searchUserPw() {
		System.out.println("userRest/searchUserPw : GET");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/user/searchUserPw.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="searchUserPw", method=RequestMethod.POST)
	@ResponseBody
	public int searchUserPw(@RequestBody User user, HttpServletRequest request, HttpSession session) throws Exception{
		
		System.out.println("/userRest/searchUserPw : POST");
		
		String authNum = "";
		authNum = RandomNum();

		System.out.println("email==>" + user.getEmail());
		System.out.println("authNum==> " + authNum);

		User dbUser = userService.getUserId(user.getUserId());
		System.out.println("User"+user);
		System.out.println("dbUser"+dbUser);
		
		if(user.getUserId().equals(dbUser.getUserId()) && user.getEmail().equals(dbUser.getEmail())) {
			
			user.setPassword(authNum);
			userService.sendMail(user.getEmail(), authNum);
			userService.searchUserPw(user);
			
			return 1;
		}else {
			return 0;
		}
	}
	// 난수생성
	public String RandomNum() {

		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);

		}
		return buffer.toString();
	}
	
	@RequestMapping(value="withdraw", method=RequestMethod.POST)
	public int withdraw(@ModelAttribute("user") User user, HttpSession session) throws Exception{
		System.out.println("/userRest/withdraw : POST");
		user.setUserNo((int)session.getAttribute("userNo"));
		user.setWithdrawCheck(1);
		userService.withdrawUser(user);
		session.invalidate();
		
		return 1;
	}
	
	@RequestMapping(value="withdrawAdmin", method=RequestMethod.POST)
	public int withdrawAdmin(@RequestBody int userNo, HttpSession session) throws Exception{
		
		System.out.println("/userRest/withdrawAdmin : POST");
		System.out.println("userNo"+userNo);
		User user = new User();
		user.setUserNo(userNo);
		
		if(userService.getUser((int)session.getAttribute("userNo")).getRole() == 0) {
			user.setWithdrawCheck(1);
			userService.withdrawUser(user);
			
			return userNo;
		}else {
			
			return 0;
		}
	}
	
	@RequestMapping(value="withdrawCancle", method=RequestMethod.POST)
	public int cancle(@RequestBody int userNo, HttpSession session) throws Exception{
		
		System.out.println("/userRest/cancle : POST");
		
		if(userService.getUser((int)session.getAttribute("userNo")).getRole() == 0) {
			User user = new User();
			user.setWithdrawCheck(0);
			user.setUserNo(userNo);
			userService.cancleUser(user);
			
			return userNo;
		}else {
			return 0;
		}
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public int login(@RequestBody User user, HttpSession session) throws Exception {
		System.out.println("/userRest/login : POST");
		System.out.println("user : "+user);
		
		User dbUser = userService.getUserId(user.getUserId());
		System.out.println("dbUser : "+ dbUser);
		if(user.getPassword().equals(dbUser.getPassword()) && dbUser.getWithdrawCheck() != 1) {
			session.setAttribute("userNo", dbUser.getUserNo());
			session.setAttribute("userName", dbUser.getUserName());
			session.setAttribute("userSetting", userSettingService.getUserSetting(dbUser.getUserNo()));
			if(dbUser.getRole() == 1) {
				return 1;
			}else {
				return 0;
			}
			
		}else if(dbUser.getWithdrawCheck() == 1){
			return -1;
		}else {
			return 2;
		}
	}
	
	/*@RequestMapping(value="userRest/authNum", method=RequestMethod.POST)
	public void authNum(@RequestBody Map<String, Object> map,
			
			HttpServletRequest request,HttpSession session)throws Exception{
		
		System.out.println("/userRest/authNum : POST");
		
		String authNum=(String)map.get("authNum");
		
		System.out.println("authNum ==> "+authNum);
		
		User getSessionAuth = (User)session.getAttribute("user");
		System.out.println("sessionAuth ==> "+getSessionAuth);
		
		if(authNum.equals(getSessionAuth.getAuthNum())) {
			System.out.println("Before updateRole===> "+getSessionAuth);
			getSessionAuth.setRole(2);
			userService.emailCheckDuplication();
			System.out.println("After updateRole===> "+getSessionAuth.getRole());
		
		}
		
		
	}*/

}
