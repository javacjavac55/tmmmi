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
	
	private Map<String, String> htmlMap;
	
	///Constructor
	public ContentController() {
		System.out.println(this.getClass());
		
	}
	
	@RequestMapping(value="getContentList", method=RequestMethod.GET)
	public ModelAndView getContentList(HttpSession session) throws Exception {
		System.out.println(contentProperties);
		if (contentProperties == null) {
			createProperties();
		}
		
		int userNo = (int)session.getAttribute("userNo");
		
		StringBuilder sb = new StringBuilder();
		Map<Integer,String> sortSection = contentSettingService.getContentSetting(userNo).getContentSettingMap();
		System.out.println("123456: "+ sortSection.keySet());
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
	
	private void createProperties() {
		htmlMap = new HashMap<String, String>();
		
		if (contentProperties != null) {
		
			//Movie
			htmlMap.put("movieBoxOffice", contentProperties.getProperty("movieBoxOffice"));
			htmlMap.put("movieNew", contentProperties.getProperty("movieNew"));
			htmlMap.put("movieUpcoming", contentProperties.getProperty("movieUpcoming"));
			htmlMap.put("movieReview", contentProperties.getProperty("movieReview"));
			htmlMap.put("movieTrailer", contentProperties.getProperty("movieTrailer"));
			
			//Sport
			htmlMap.put("soccer", contentProperties.getProperty("soccer"));
			htmlMap.put("overseaSoccer", contentProperties.getProperty("overseaSoccer"));
			htmlMap.put("baseball", contentProperties.getProperty("baseball"));
			htmlMap.put("overseaBaseball", contentProperties.getProperty("overseaBaseball"));
			htmlMap.put("basketball", contentProperties.getProperty("basketball"));
			htmlMap.put("sportGeneral", contentProperties.getProperty("sportGeneral"));
			htmlMap.put("sportHighlight", contentProperties.getProperty("sportHighlight"));
			
			//Tasty
			htmlMap.put("showTastyKeyword", contentProperties.getProperty("showTastyKeyword"));
			
			//Shopping
			htmlMap.put("showShoppingSearch1", contentProperties.getProperty("showShoppingSearch1"));
			htmlMap.put("showShoppingSearch2", contentProperties.getProperty("showShoppingSearch2"));
			htmlMap.put("showShoppingSearch3", contentProperties.getProperty("showShoppingSearch3"));
			htmlMap.put("showShoppingReview", contentProperties.getProperty("showShoppingReview"));
			
			//Keyword
			htmlMap.put("showUserSearch1", contentProperties.getProperty("showUserSearch1"));
			htmlMap.put("showUserSearch2", contentProperties.getProperty("showUserSearch2"));
			htmlMap.put("showUserSearch3", contentProperties.getProperty("showUserSearch3"));
			htmlMap.put("showUserVideo1", contentProperties.getProperty("showUserVideo1"));
			htmlMap.put("showUserVideo2", contentProperties.getProperty("showUserVideo2"));
			
			System.out.println("value set:" + htmlMap);
		} else {
			System.out.println("property null");
		}
	}
}
