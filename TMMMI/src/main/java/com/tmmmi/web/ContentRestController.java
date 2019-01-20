package com.tmmmi.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.contentsetting.ContentSettingService;
@RestController
@RequestMapping("/contentRest/*")
public class ContentRestController {
	
	///Field
	@Autowired
	@Qualifier("contentServiceImpl")
	private ContentService contentService;
	private ContentSettingService contentSettingService;
	
	///Constructor
	public ContentRestController() {
	}
	
	///Method
	@RequestMapping(value="/getContentList")
	public void getContentList() {
		
	}
}
