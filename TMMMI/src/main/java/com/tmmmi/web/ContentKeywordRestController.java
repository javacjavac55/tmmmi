package com.tmmmi.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.contentsetting.ContentSettingService;
import com.tmmmi.service.domain.ContentUserKeyword;
import com.tmmmi.service.usersetting.UserSettingService;

@RestController
@RequestMapping("/contentKeywordRest/*")
public class ContentKeywordRestController {
	
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	@Autowired
	@Qualifier("contentKeywordServiceImpl")
	private ContentService contentUserKeywordService;
	
	@Autowired
	@Qualifier("userSettingServiceImpl")
	private UserSettingService userSettingService;
	
	public ContentKeywordRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="getUserKeywordListFirst", method=RequestMethod.GET)
	public List<ContentUserKeyword> getUserKeywordListFirst(@RequestParam("index") int index,HttpSession session) throws Exception{
		System.out.println("getUserKeywordListFirst : GET");
		int userNo = (int)session.getAttribute("userNo");
		return contentUserKeywordService.getContentUserKeywordFirstList(contentSettingService.getContentSetting(userNo), index);
	}
	
	@RequestMapping(value="getUserKeywordListSecond", method=RequestMethod.GET)
	public List<ContentUserKeyword> getUserKeywordListSecond(@RequestParam("index") int index, HttpSession session) throws Exception{
		System.out.println("getUserKeywordListSecond : GET");
		int userNo = (int)session.getAttribute("userNo");
		return contentUserKeywordService.getContentUserKeywordSecondList(contentSettingService.getContentSetting(userNo), index);
	}
	
	@RequestMapping(value="getUserKeywordListThird", method=RequestMethod.GET)
	public List<ContentUserKeyword> getUserKeywordListThird(@RequestParam("index") int index, HttpSession session) throws Exception{
		System.out.println("getUserKeywordListThird : GET");
		int userNo = (int)session.getAttribute("userNo");
		return contentUserKeywordService.getContentUserKeywordThirdList(contentSettingService.getContentSetting(userNo), index);
	}
	
	@RequestMapping(value="getUserVideoListFirst", method=RequestMethod.GET)
	public List<ContentUserKeyword> getUserVideoListFirst(@RequestParam("index") int index, HttpSession session) throws Exception{
		System.out.println("getUserVideoListFirst : GET");
		int userNo = (int)session.getAttribute("userNo");	
		return contentUserKeywordService.getContentUserKeywordVideoFirstList(contentSettingService.getContentSetting(userNo), index);
	}
	
	@RequestMapping(value="getUserVideoListSecond", method=RequestMethod.GET)
	public ModelAndView getUserVideoListSecond(HttpSession session) throws Exception{
		System.out.println("getUserVideoListSecond : GET");
		
		int userNo = (int)session.getAttribute("userNo");	
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userVideoSecondList", contentUserKeywordService.getContentUserKeywordVideoSecondList(contentSettingService.getContentSetting(userNo), 0));
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/userVideoContentSecond.jsp");
		return modelAndView;
	}
}
