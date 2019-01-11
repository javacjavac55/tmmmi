package com.tmmmi.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.contentsetting.ContentSettingService;

public class ContentRestController {

	private ContentService contentService;

	private ContentSettingService contentSettingService;

	public ContentRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	public void getContentList() {}

}
