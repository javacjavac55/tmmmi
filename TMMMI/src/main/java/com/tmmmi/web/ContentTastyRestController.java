package com.tmmmi.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.contentsetting.ContentSettingService;

@RestController
@RequestMapping("/contentTastyRest/*")
public class ContentTastyRestController {
	
	///Field
	@Autowired
	@Qualifier("contentTastyServiceImpl")
	private ContentService contentTastyService;	
	
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	///Constructor
	public ContentTastyRestController() {
		System.out.println(this.getClass());
	}
	@RequestMapping(value="/restContentTastyList", method=RequestMethod.GET)
	public List<Object> getContentList(HttpSession session)throws Exception {
		
		int userNo = (int) session.getAttribute("userNo");
		return contentTastyService.getContentTastyList(contentSettingService.getContentSetting(userNo), 0);
	}
}
