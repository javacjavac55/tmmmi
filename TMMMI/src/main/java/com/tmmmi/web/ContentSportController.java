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
@RequestMapping("/contentSport/*")
public class ContentSportController {
	
	@Autowired
	@Qualifier("contentSportServiceImpl")
	private ContentService contentSportService;	
	
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	public ContentSportController() {
		// TODO Auto-generated constructor stub
	}
	
	/*@RequestMapping(value="getContentMap", method=RequestMethod.GET)
	public ModelAndView getContentMap(HttpSession session) throws Exception {
		int userNo = (int)session.getAttribute("userNo");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentMap", contentService.getContentMap(contentSettingService.getContentSetting(userNo), 1));
		modelAndView.setViewName("/content/listContent.jsp");
		
		return modelAndView;
	}*/
	
	/*�����౸*/
	@RequestMapping(value="getContentKsoccerList", method=RequestMethod.GET)
	public ModelAndView getContentKsoccerList(HttpSession session)throws Exception  {
		
		
		
		System.out.println("content/sportContent : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<Object> sportList = contentSportService.getContentKsoccerList(contentSetting , 1);
		
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.setViewName("/content/kSoccerContent.jsp");
		
		return modelAndView;
	}
	
	/*�ؿ��౸*/
	@RequestMapping(value="getContentWsoccerList", method=RequestMethod.GET)
	public ModelAndView getContentWsoccerList(HttpSession session)throws Exception  {		
		
		System.out.println("content/sportContent : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<Object> sportList = contentSportService.getContentWsoccerList(contentSetting , 1);
		
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.setViewName("/content/wSoccerContent.jsp");
		
		return modelAndView;
	}
	
	/*�����߱�*/
	@RequestMapping(value="getContentKbaseballList", method=RequestMethod.GET)
	public ModelAndView getContentKbaseballList(HttpSession session)throws Exception  {		
		
		System.out.println("content/sportContent : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<Object> sportList = contentSportService.getContentKbaseballList(contentSetting , 1);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.setViewName("/content/kBaseballContent.jsp");
		
		return modelAndView;
	}
	
	/*�ؿܾ߱�*/
	@RequestMapping(value="getContentWbaseballList", method=RequestMethod.GET)
	public ModelAndView getContentWbaseballList(HttpSession session)throws Exception  {		
		
		System.out.println("content/sportContent : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<Object> sportList = contentSportService.getContentWbaseballList(contentSetting , 1);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.setViewName("/content/wBaseballContent.jsp");
		
		return modelAndView;
	}
	
	/*��*/
	@RequestMapping(value="getContentBasketballList", method=RequestMethod.GET)
	public ModelAndView getContentBasketballList(HttpSession session)throws Exception  {		
		
		System.out.println("content/sportContent : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<Object> sportList = contentSportService.getContentBasketballList(contentSetting , 1);
		
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.setViewName("/content/basketballContent.jsp");
		
		return modelAndView;
	}
	
	/*�Ϲ�*/
	@RequestMapping(value="getContentGeneralList", method=RequestMethod.GET)
	public ModelAndView getContentGeneralList(HttpSession session)throws Exception  {		
		
		System.out.println("content/sportContent : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<Object> sportList = contentSportService.getContentGeneralList(contentSetting , 1);
		
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.setViewName("/content/generalContent.jsp");
		
		return modelAndView;
	}
	
	
}
