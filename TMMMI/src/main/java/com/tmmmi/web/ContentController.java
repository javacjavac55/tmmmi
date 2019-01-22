package com.tmmmi.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.contentsetting.ContentSettingService;
import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.UserSetting;

@Controller
@RequestMapping("/content/*")
public class ContentController {
	
	@Autowired
	@Qualifier("contentServiceImpl")
	private ContentService contentService;	
	
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	public ContentController() {
		// TODO Auto-generated constructor stub
	}
	
	
	/*public void getContent() {}*/
	@RequestMapping(value="getContentKsoccerList", method=RequestMethod.GET)
	public ModelAndView getContentKsoccerList(HttpSession session)throws Exception  {
		
		
		
		System.out.println("content/sportContent : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<Object> sportList = contentService.getContentSportList(contentSetting , 1);
		
		System.out.println("아아아"+ sportList);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.setViewName("/content/KsoccerContent.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="getContentWsoccerList", method=RequestMethod.GET)
	public ModelAndView getContentWsoccerList(HttpSession session)throws Exception  {		
		
		System.out.println("content/sportContent : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<Object> sportList = contentService.getContentSportList(contentSetting , 1);
		
		System.out.println("아아아"+ sportList);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.setViewName("/content/WsoccerContent.jsp");
		
		return modelAndView;
	}
	
	
}
