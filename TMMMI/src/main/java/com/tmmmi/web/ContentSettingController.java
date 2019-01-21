package com.tmmmi.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.contentsetting.ContentSettingService;
import com.tmmmi.service.domain.ContentSetting;

@Controller
@RequestMapping("/contentSetting/*")
public class ContentSettingController {
	///Field
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	///Constructor
	public ContentSettingController() {
		System.out.println(this.getClass());
	}
	
	///Method
	@RequestMapping(value="getContentSetting", method=RequestMethod.GET)
	public ModelAndView getContentSetting(HttpSession session) {
		System.out.println("/contentSetting/getContentSetting : GET");
		int userNo = (int)session.getAttribute("userNo");
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSetting", contentSetting);
		modelAndView.setViewName("/contentSetting/contentSetting.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="updateContentSetting", method=RequestMethod.POST)
	public ModelAndView updateContentSetting(@ModelAttribute("contentSetting") ContentSetting contentSetting, HttpSession session) {
		System.out.println("/contentSetting/updateContentSetting : POST");
		contentSettingService.updateContentSetting(contentSetting);
		
		int userNo = (int)session.getAttribute("userNo");
		contentSetting = contentSettingService.getContentSetting(userNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSetting", contentSetting);
		modelAndView.setViewName("/contentSetting/contentSetting.jsp");
		
		return modelAndView;
	}
}
