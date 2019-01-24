package com.tmmmi.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.tmmmi.service.contentsetting.ContentSettingService;

@Controller
@RequestMapping("/contentMovie/*")
public class ContentMovieController {
	
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	public ContentMovieController() {
		// TODO Auto-generated constructor stub
	}
		
}
