package com.tmmmi.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.contentsetting.ContentSettingService;
import com.tmmmi.service.domain.ContentSetting;
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
	public List<String>  getContentList(@RequestBody ContentSetting contentSetting ) {
		
		List<String> contentList = contentService.getContentList(contentSetting);
		System.out.println(contentList);
		return contentList;
	}
}
