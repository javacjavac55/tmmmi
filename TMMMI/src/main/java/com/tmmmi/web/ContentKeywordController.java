package com.tmmmi.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.content.impl.ContentKeywordServiceImpl;
import com.tmmmi.service.contentsetting.ContentSettingService;

@Controller
@RequestMapping("/contentKeyword/*")
public class ContentKeywordController {
	
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	@Autowired
	@Qualifier("contentKeywordServiceImpl")
	private ContentService contentUserKeywordService;
	
	public ContentKeywordController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="getUserKeywordList", method=RequestMethod.GET)
	public ModelAndView getUserKeywordList(HttpSession session) throws Exception{
		System.out.println("getUserKeywordList : GET");
		
		int userNo = (int)session.getAttribute("userNo");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userKeywordFirstList", contentUserKeywordService.getContentUserKeywordFirstList(contentSettingService.getContentSetting(userNo), 0));
		modelAndView.addObject("userKeywordSecondList", contentUserKeywordService.getContentUserKeywordFirstList(contentSettingService.getContentSetting(userNo), 0));
		modelAndView.addObject("userKeywordThirdList", contentUserKeywordService.getContentUserKeywordFirstList(contentSettingService.getContentSetting(userNo), 0));
		modelAndView.setViewName("/content/userKeywordContent.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="getUserVideoList", method=RequestMethod.GET)
	public ModelAndView getUserVideoList(HttpSession session) throws Exception{
		System.out.println("getUserVideoList : GET");
		
		int userNo = (int)session.getAttribute("userNo");	
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userVideoFirstList", contentUserKeywordService.getContentUserKeywordVideoFirstList(contentSettingService.getContentSetting(userNo), 0));
		modelAndView.addObject("userVideoSecondList", contentUserKeywordService.getContentUserKeywordVideoSecondList(contentSettingService.getContentSetting(userNo), 0));
		modelAndView.setViewName("/content/contentUserVideo.jsp");
		return modelAndView;
	}
	
}