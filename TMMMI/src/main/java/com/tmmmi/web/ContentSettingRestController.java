package com.tmmmi.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tmmmi.service.contentsetting.ContentSettingService;
import com.tmmmi.service.domain.ContentSetting;

@RestController
@RequestMapping("/contentSettingRest/*")
public class ContentSettingRestController {
	///Field
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	///Constructor
	public ContentSettingRestController() {
		System.out.println(this.getClass());
	}
	
	///Method
	@RequestMapping(value="updateContentSetting", method=RequestMethod.POST)
	public boolean updateContentSetting(@RequestBody ContentSetting upContentSetting, HttpSession session) {
		System.out.println("/contentSetting/updateContentSetting : POST");
		int userNo = (int)session.getAttribute("userNo");
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		if(upContentSetting.equals(contentSetting)) {
			return false;
		}else {
			contentSettingService.updateContentSetting(contentSetting);
			return true;
		}
	}
}
