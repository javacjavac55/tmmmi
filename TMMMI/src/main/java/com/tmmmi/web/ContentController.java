package com.tmmmi.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.contentsetting.ContentSettingService;
@Controller
@RequestMapping("/content/*")
public class ContentController {
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	///Constructor
	public ContentController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="getContentList", method=RequestMethod.GET)
	public ModelAndView getContentList(HttpSession session) throws Exception {
		int userNo = (int)session.getAttribute("userNo");
		
		System.out.println(contentSettingService.getContentSetting(userNo).getContentSettingMap());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/content/listContent.jsp");
		
		return modelAndView;
	}
}
