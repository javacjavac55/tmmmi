package com.tmmmi.web;

import java.util.List;

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
@RequestMapping("/contentTasty/*")
public class ContentTastyController {
	
	@Autowired
	@Qualifier("contentTastyServiceImpl")
	private ContentService contentTastyService;	
	
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	@Autowired
	@Qualifier("userSettingServiceImpl")
	private UserSettingService userSettingService;
	
	@RequestMapping(value="/getContentTastyList", method=RequestMethod.GET)
	public ModelAndView getContentTastyList(HttpSession session)throws Exception {
		
		int userNo = (int) session.getAttribute("userNo");
		List<Object> contentList = contentTastyService.getContentTastyList(contentSettingService.getContentSetting(userNo), 0);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentTastyList", contentList);
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/tastyContent.jsp");
		System.out.println(contentList);
		System.out.println(contentList.size());
		return modelAndView;
	}
}
