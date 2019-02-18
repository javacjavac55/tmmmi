package com.tmmmi.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.contentsetting.ContentSettingService;
import com.tmmmi.service.usersetting.UserSettingService;

@Controller
@RequestMapping("/contentKeyword/*")
public class ContentKeywordController {
	
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	@Autowired
	@Qualifier("contentKeywordServiceImpl")
	private ContentService contentUserKeywordService;
	
	@Autowired
	@Qualifier("userSettingServiceImpl")
	private UserSettingService userSettingService;
	
	public ContentKeywordController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="getUserKeywordListFirst", method=RequestMethod.GET)
	public ModelAndView getUserKeywordListFirst(HttpSession session) throws Exception{
		System.out.println("getUserKeywordListFirst : GET");
		
		int userNo = (int)session.getAttribute("userNo");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userSearch", contentSettingService.getContentSetting(userNo).getUserSearch1());
		modelAndView.addObject("userKeywordFirstList", contentUserKeywordService.getContentUserKeywordFirstList(contentSettingService.getContentSetting(userNo), 0));
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/userKeywordContentFirst.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="getUserKeywordListSecond", method=RequestMethod.GET)
	public ModelAndView getUserKeywordListSecond(HttpSession session) throws Exception{
		System.out.println("getUserKeywordListSecond : GET");
		
		int userNo = (int)session.getAttribute("userNo");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userKeywordSecondList", contentUserKeywordService.getContentUserKeywordSecondList(contentSettingService.getContentSetting(userNo), 0));
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/userKeywordContentSecond.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="getUserKeywordListThird", method=RequestMethod.GET)
	public ModelAndView getUserKeywordListThird(HttpSession session) throws Exception{
		System.out.println("getUserKeywordListThird : GET");
		
		int userNo = (int)session.getAttribute("userNo");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userKeywordThirdList", contentUserKeywordService.getContentUserKeywordThirdList(contentSettingService.getContentSetting(userNo), 0));
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/userKeywordContentThird.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="getUserVideoListFirst", method=RequestMethod.GET)
	public ModelAndView getUserVideoListFirst(HttpSession session) throws Exception{
		System.out.println("getUserVideoListFirst : GET");
		
		int userNo = (int)session.getAttribute("userNo");	
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userVideoFirstList", contentUserKeywordService.getContentUserKeywordVideoFirstList(contentSettingService.getContentSetting(userNo), 0, null));
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/userVideoContentFirst.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getUserVideoListSecond", method=RequestMethod.GET)
	public ModelAndView getUserVideoListSecond(HttpSession session) throws Exception{
		System.out.println("getUserVideoListSecond : GET");
		
		int userNo = (int)session.getAttribute("userNo");	
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userVideoSecondList", contentUserKeywordService.getContentUserKeywordVideoSecondList(contentSettingService.getContentSetting(userNo), 0, null));
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/userVideoContentSecond.jsp");
		return modelAndView;
	}
	
}