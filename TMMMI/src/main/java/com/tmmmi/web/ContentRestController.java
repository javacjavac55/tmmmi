package com.tmmmi.web;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	///Constructor
	public ContentRestController() {
		System.out.println(this.getClass());
	}
	
	/*///Method
	@RequestMapping(value="/getContentTastyList")
	public List<Object> getContentList( int index)throws Exception {
		List<Object> contentList = contentService.getContentTastyList(contentSetting, index);
		System.out.println(contentList);
		System.out.println(contentList.size());
		return contentList;
	}*/
	/*
	///Method
		@RequestMapping(value="/getContentSportList")
		public List<Object> getContentSportList(@RequestBody ContentSetting contentSetting, HttpSession session)throws Exception {
			int userNo = ((int)session.getAttribute("userNo"));		
			contentSetting = contentSettingService.getContentSetting(userNo);
			
			List<Object> sportList = contentService.getContentSportList(contentSettingn);
			System.out.println(sportList);
			return sportList;
		}*/
}
