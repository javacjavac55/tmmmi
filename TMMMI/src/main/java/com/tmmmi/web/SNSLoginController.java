package com.tmmmi.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.user.GoogleService;
import com.tmmmi.service.user.NaverService;
import com.tmmmi.service.user.KakaoService;
import com.tmmmi.service.user.UserService;
import com.tmmmi.service.usersetting.UserSettingService;
import com.tmmmi.service.domain.User;

@Controller
@RequestMapping("/SNSLogin/*")
public class SNSLoginController {
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	@Autowired
	@Qualifier("userSettingServiceImpl")
	private UserSettingService userSetting;
	@Autowired
	@Qualifier("naverServiceImpl")
	private NaverService naverService;
	@Autowired
	@Qualifier("googleServiceImpl")
	private GoogleService googleService;
	@Autowired
	@Qualifier("kakaoServiceImpl")
	private KakaoService KakaoService;
	
	@RequestMapping(value = "naverLoginRequest", method = RequestMethod.GET)
	public String naverLoginRequest(HttpSession session) {

		System.out.println("[ Naver Login Request!! ]");

		return naverService.getAuthorizationUrl_login(session);

	}
	
	@RequestMapping(value = "naverLogin", method = RequestMethod.GET)
	public String naverLogin(@RequestParam("code") String code, @RequestParam("state") String state, Model model,
			HttpSession session) throws Exception {

		System.out.println("naverLogin/code받아서 토큰 요청하기");
		System.out.println("Code : "+code+", state : "+state);
		User user = naverService.getAccessToken(session, code, state);
		user = naverService.getUserProfile(user);

		boolean result = userService.emailCheckDuplication(user.getEmail());

		// System.out.println("받아온정보"+user.getSnsType());
		if (result == true) {// 이메일정보가 db에 없을경우

			session.setAttribute("user", user);
			userService.addUser(user);// snstype으로 회원가입

			System.out.println("네이버계정으로 회원가입");
		} else  {
			session.setAttribute("user", user);

			System.out.println("네이버계정으로 로그인");
		}

		// userService.snsAddUser(user);
		System.out.println("code ==>" + code);
		System.out.println("state  ==>" + state);
		System.out.println("user정보 ==>" + user);

		System.out.println("session 저장정보===>" + session.getAttribute("user"));
		System.out.println("이메일 ==> " + user.getEmail());
		
		session.setAttribute("userNo", userService.getUserId(user.getUserId()).getUserNo());
		session.setAttribute("userName", userService.getUserId(user.getUserId()).getUserName());
		session.setAttribute("userSetting", userSetting.getUserSetting(userService.getUserId(user.getUserId()).getUserNo()));
		return "forward:/user/snsLogin.jsp";
	}
	
	@RequestMapping(value = "googleLoginRequest", method = { RequestMethod.GET, RequestMethod.POST })
	public String GoogleLoginRequest(HttpSession session) {

		System.out.println("[ Google Login Request!! ]");

		return googleService.getAuthorizationUrl(session);

	}

	@RequestMapping(value = "googleLogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleLogin(@RequestParam("code") String code, Model model, HttpSession session) throws Exception {
		System.out.println(":: GoogleLogin ::");
		System.out.println("code : "+code);
		User user = googleService.getAccessToken(session, code);
		user = googleService.getUserProfile(user);

		boolean result = userService.emailCheckDuplication(user.getEmail());

		// System.out.println("받아온정보"+user.getSnsType());
		if (result == true) {// 이메일정보가 db에 없을경우
			userService.addUser(user);// snstype으로 회원가입
			System.out.println("구글계정으로 회원가입");
		} else{
			session.setAttribute("user", user);

			System.out.println("구글계정으로 로그인");
		}
		
		session.setAttribute("userNo", userService.getUserId(user.getUserId()).getUserNo());
		session.setAttribute("userName", userService.getUserId(user.getUserId()).getUserName());
		session.setAttribute("userSetting", userSetting.getUserSetting(userService.getUserId(user.getUserId()).getUserNo()));
		
		return "forward:/user/snsLogin.jsp";
	}
	
	@RequestMapping(value = "kakaoLoginRequest", method = { RequestMethod.GET, RequestMethod.POST })
	public String KakaoLoginRequest(HttpSession session) {

		System.out.println("[ Kakao Login Request!! ]");

		return KakaoService.getAuthorizationUrl(session);

	}

	@RequestMapping(value = "kakaoLogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String KakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) throws Exception {
		System.out.println(":: KakaoLogin ::");

		User user = KakaoService.getAccessToken(session, code);
		user = KakaoService.getUserProfile(user);
		boolean result;
		
		if(userService.getUserId(user.getUserId()) == null) {
			result = true;
		}else {
			result = false;
		}

		// System.out.println("받아온정보"+user.getSnsType());
		if (result == true) {// 이메일정보가 db에 없을경우

			session.setAttribute("user", user);
			if(userService.getUserId(user.getUserId()) == null){
				userService.addUser(user);// snstype으로 회원가입
				session.setAttribute("userNo", userService.getUserId(user.getUserId()).getUserNo());
				System.out.println("userNo : "+userService.getUserId(user.getUserId()).getUserNo());
				System.out.println("카카오 계정으로 회원가입");
			}
			
			return "forward:/user/snsAddUser.jsp";
			
		} else{
			session.setAttribute("userNo", userService.getUserId(user.getUserId()).getUserNo());
			System.out.println("카카오 계정으로 로그인");
			
			if(userService.getUserId(user.getUserId()).getUserName() == null) {
				System.out.println("닉네임 없음");
				return "forward:/user/snsLogin.jsp";
			}else {
				System.out.println("닉네임 있음");
				session.setAttribute("userName", userService.getUserId(user.getUserId()).getUserName());
				session.setAttribute("userSetting", userSetting.getUserSetting(userService.getUserId(user.getUserId()).getUserNo())); 
				return "forward:/user/snsLogin.jsp";
			}
		}
	}
}
