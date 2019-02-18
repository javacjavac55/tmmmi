package com.tmmmi.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.contentsetting.ContentSettingService;
import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentSport;
import com.tmmmi.service.usersetting.UserSettingService;

@Controller
@RequestMapping("/contentSport/*")
public class ContentSportController {
	
	@Autowired
	@Qualifier("contentSportServiceImpl")
	private ContentService contentSportService;	
	
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	@Autowired
	@Qualifier("userSettingServiceImpl")
	private UserSettingService userSettingService;
	
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
		
		System.out.println("contentSport/getContentKsoccerList : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<ContentSport> sportList = contentSportService.getContentKsoccerList(0);
				
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/kSoccerContent.jsp");
		
		return modelAndView;
	}
	
	/*�ؿ��౸*/
	@RequestMapping(value="getContentWsoccerList", method=RequestMethod.GET)
	public ModelAndView getContentWsoccerList(HttpSession session)throws Exception  {		
		
		System.out.println("contentSport/getContentWsoccerList : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<ContentSport> sportList = contentSportService.getContentWsoccerList(0);
		
		System.out.println("����Ʈ:: "+sportList);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/wSoccerContent.jsp");
		
		return modelAndView;
	}
	
	/*�����߱�*/
	@RequestMapping(value="getContentKbaseballList", method=RequestMethod.GET)
	public ModelAndView getContentKbaseballList(HttpSession session)throws Exception  {		
		
		System.out.println("contentSport/getContentKbaseballList : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<ContentSport> sportList = contentSportService.getContentKbaseballList(0);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/kBaseballContent.jsp");
		
		return modelAndView;
	}
	
	/*�ؿܾ߱�*/
	@RequestMapping(value="getContentWbaseballList", method=RequestMethod.GET)
	public ModelAndView getContentWbaseballList(HttpSession session)throws Exception  {		
		
		System.out.println("contentSport/getContentWbaseballList : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<ContentSport> sportList = contentSportService.getContentWbaseballList(0);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/wBaseballContent.jsp");
		
		return modelAndView;
	}
	
	/*��*/
	@RequestMapping(value="getContentBasketballList", method=RequestMethod.GET)
	public ModelAndView getContentBasketballList(HttpSession session)throws Exception  {		
		
		System.out.println("contentSport/getContentBasketballList : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<ContentSport> sportList = contentSportService.getContentBasketballList(0);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/basketballContent.jsp");
		
		return modelAndView;
	}
	
	/*�Ϲ�*/
	@RequestMapping(value="getContentGeneralList", method=RequestMethod.GET)
	public ModelAndView getContentGeneralList(HttpSession session)throws Exception  {		
		
		System.out.println("contentSport/getContentGeneralList : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<ContentSport> sportList = contentSportService.getContentGeneralList(0);
		
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/generalContent.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="getContentHighlightList", method=RequestMethod.GET)
	public ModelAndView getContenntHighlightList(HttpSession session)throws Exception{
		
		System.out.println("contentSport/getContentHighlightList : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo: "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<ContentSport> sportList = contentSportService.getContentHighlightList(0);
		
		ModelAndView modelAndView = new	 ModelAndView();
		modelAndView.addObject("contentSport", sportList);
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/highlightContent.jsp");
		
		return modelAndView;
	}
	
}
