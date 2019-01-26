package com.tmmmi.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.contentsetting.ContentSettingService;
import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.UserSetting;

@Controller
@RequestMapping("/contentTasty/*")
public class ContentTastyController {
	
	@Autowired
	@Qualifier("contentTastyServiceImpl")
	private ContentService contentTastyService;	
	
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	@RequestMapping(value="contentTasty", method=RequestMethod.GET)
	public ModelAndView getContentList(@RequestBody ContentSetting contentSetting, int index)throws Exception {
		List<Object> contentList = contentTastyService.getContentTastyList(contentSetting, index);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentTastyList", contentList);
		modelAndView.setViewName("/content/tastyContent.jsp");
		System.out.println(contentList);
		System.out.println(contentList.size());
		return modelAndView;
	}
}
