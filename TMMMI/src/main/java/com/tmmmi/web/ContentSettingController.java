package com.tmmmi.web;

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
import com.tmmmi.service.domain.ContentSetting;

@Controller
@RequestMapping("/contentSetting/*")
public class ContentSettingController {
	///Field
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	@Resource(name="contentProperties")
	private Properties contentProperties;
	
	///Constructor
	public ContentSettingController() {
		System.out.println(this.getClass());
	}
	
	///Method
	@RequestMapping(value="getContentSetting", method=RequestMethod.GET)
	public ModelAndView getContentSetting(HttpSession session) throws IllegalArgumentException, IllegalAccessException {
		System.out.println("/contentSetting/getContentSetting : GET");
		int userNo = (int)session.getAttribute("userNo");
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		
		StringBuilder sb = new StringBuilder();
		Map<Integer,String> sortSection = contentSetting.getContentSettingMap();
		for (Integer key:sortSection.keySet()) {
			if (!key.equals(0)) {
				System.out.println("name:"+sortSection.get(key));
				System.out.println("html:"+contentProperties.get(sortSection.get(key)));
				sb.append(contentProperties.get("setting_"+sortSection.get(key)));
			}
		}
		
		String contentHtml = sb.toString().replaceAll("#@tasty@#", contentSetting.getTastyKeyword())
											.replaceAll("#@shopping1@#", contentSetting.getShoppingSearch1())
											.replaceAll("#@shopping2@#", contentSetting.getShoppingSearch2())
											.replaceAll("#@shopping3@#", contentSetting.getShoppingSearch3())
											.replaceAll("#@shopping4@#", contentSetting.getShoppingReview())
											.replaceAll("#@user1@#", contentSetting.getUserSearch1())
											.replaceAll("#@user2@#", contentSetting.getUserSearch2())
											.replaceAll("#@user3@#", contentSetting.getUserSearch3())
											.replaceAll("#@user4@#", contentSetting.getUserVideo1())
											.replaceAll("#@user5@#", contentSetting.getUserVideo2());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSetting", contentSetting);
		modelAndView.addObject("contentHtml", contentHtml);
		modelAndView.setViewName("/contentSetting/contentSetting.jsp");
		
		return modelAndView;
	}
	
	/*@RequestMapping(value="updateContentSetting", method=RequestMethod.POST)
	public ModelAndView updateContentSetting(@ModelAttribute("contentSetting") ContentSetting contentSetting, HttpSession session) {
		System.out.println("/contentSetting/updateContentSetting : POST");
		contentSettingService.updateContentSetting(contentSetting);
		
		int userNo = (int)session.getAttribute("userNo");
		contentSetting = contentSettingService.getContentSetting(userNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSetting", contentSetting);
		modelAndView.setViewName("/contentSetting/contentSetting.jsp");
		
		return modelAndView;
	}*/
}
