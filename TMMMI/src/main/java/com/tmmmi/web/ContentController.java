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
import com.tmmmi.service.domain.ContentSetting;
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
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		
		StringBuilder sb = new StringBuilder();
		StringBuilder sb2 = new StringBuilder();
		Map<Integer,String> sortSection = contentSetting.getContentSettingMap();
		for (Integer key:sortSection.keySet()) {
			if (!key.equals(0)) {
				System.out.println("name:"+sortSection.get(key));
				System.out.println("html:"+contentProperties.get(sortSection.get(key)));
				sb.append(contentProperties.get(sortSection.get(key)));
				sb2.append(contentProperties.get("menu_"+sortSection.get(key)));
			}
		}
		
		String sectionNaviHtml = sb2.toString().replaceAll("#@tasty@#", contentSetting.getTastyKeyword())
												.replaceAll("#@shopping1@#", contentSetting.getShoppingSearch1())
												.replaceAll("#@shopping2@#", contentSetting.getShoppingSearch2())
												.replaceAll("#@shopping3@#", contentSetting.getShoppingSearch3())
												.replaceAll("#@shopping4@#", contentSetting.getShoppingReview())
												.replaceAll("#@user1@#", contentSetting.getUserSearch1())
												.replaceAll("#@user2@#", contentSetting.getUserSearch2())
												.replaceAll("#@user3@#", contentSetting.getUserSearch3())
												.replaceAll("#@user4@#", contentSetting.getUserVideo1())
												.replaceAll("#@user5@#", contentSetting.getUserVideo2());
		
		System.out.println(sb);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentHtml", sb.toString());
		modelAndView.addObject("sectionNaviHtml", sectionNaviHtml);
		modelAndView.setViewName("/content/listContent.jsp");
		
		return modelAndView;
	}
}
