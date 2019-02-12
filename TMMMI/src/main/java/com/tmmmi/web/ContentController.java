package com.tmmmi.web;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
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
	
	@Resource(name="contentProperties")
	private Properties contentProperties;
	
	///Constructor
	public ContentController() {
		System.out.println(this.getClass());
		
	}
	
	@RequestMapping(value="getContentList", method=RequestMethod.GET)
	public ModelAndView getContentList(HttpSession session) throws Exception {
		
		int userNo = (int)session.getAttribute("userNo");
		
		StringBuilder sb = new StringBuilder();
		Map<Integer,String> sortSection = contentSettingService.getContentSetting(userNo).getContentSettingMap();
		for (Integer key:sortSection.keySet()) {
			if (!key.equals(0)) {
				System.out.println("name:"+sortSection.get(key));
				System.out.println("html:"+contentProperties.get(sortSection.get(key)));
				sb.append(contentProperties.get(sortSection.get(key)));
			}
		}
		
		System.out.println(sb);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentHtml", sb.toString());
		modelAndView.setViewName("/content/listContent.jsp");
		
		return modelAndView;
	}
}
