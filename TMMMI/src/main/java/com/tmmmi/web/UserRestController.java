package com.tmmmi.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		System.out.println("userID : "+userId);
		System.out.println("/userRest/checkDuplication : POST");
		boolean result=userService.checkDuplication(userId);
		System.out.println(result);
		return result;	
	}
	
	//이메일인증
	/*@RequestMapping(value = "userRest/emailAuth", method = RequestMethod.POST )
	public boolean emailAuth(@RequestBody String email, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("/userRest/emailAuth : POST");

		String inputEmail = email;
		String authNum = "";

		authNum = RandomNum();

		System.out.println("email==>" + inputEmail);
		System.out.println("authNum==> " + authNum);

		boolean result = userService.sendMail(email, authNum);

		session.setAttribute("authNum", authNum);

		return result;
	}*/
	@RequestMapping(value = "userRest/emailAuth", method = RequestMethod.POST )
	public String emailAuth(@RequestBody String email, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("/userRest/emailAuth : POST");

		String inputEmail = email;
		String authNum = "";

		authNum = RandomNum();

		System.out.println("email==>" + inputEmail);
		System.out.println("authNum==> " + authNum);

		boolean result = userService.sendMail(email, authNum);

		session.setAttribute("authNum", authNum);

		return "forward:/user/addUser.jsp";
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
	
	public void naverLogin() {}
	public void kakaoLogin() {}
	public void googleLogin() {}

}
