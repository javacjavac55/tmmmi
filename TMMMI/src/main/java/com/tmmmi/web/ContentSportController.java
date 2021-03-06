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
	
	/*국내축구*/
	@RequestMapping(value="getContentKsoccerList", method=RequestMethod.GET)
	public ModelAndView getContentKsoccerList(HttpSession session)throws Exception  {				
		
		System.out.println("contentSport/getContentKsoccerList : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<ContentSport> sportList = contentSportService.getContentSportKsoccerList(0);
				
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/sportKSoccer.jsp");
		
		return modelAndView;
	}
	
	/*해외축구*/
	@RequestMapping(value="getContentWsoccerList", method=RequestMethod.GET)
	public ModelAndView getContentWsoccerList(HttpSession session)throws Exception  {		
		
		System.out.println("contentSport/getContentWsoccerList : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<ContentSport> sportList = contentSportService.getContentSportWsoccerList(0);
		
		System.out.println("리스트:: "+sportList);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/sportWSoccer.jsp");
		
		return modelAndView;
	}
	
	/*국내야구*/
	@RequestMapping(value="getContentKbaseballList", method=RequestMethod.GET)
	public ModelAndView getContentKbaseballList(HttpSession session)throws Exception  {		
		
		System.out.println("contentSport/getContentKbaseballList : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<ContentSport> sportList = contentSportService.getContentSportKbaseballList(0);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/sportKBaseball.jsp");
		
		return modelAndView;
	}
	
	/*해외야구*/
	@RequestMapping(value="getContentWbaseballList", method=RequestMethod.GET)
	public ModelAndView getContentWbaseballList(HttpSession session)throws Exception  {		
		
		System.out.println("contentSport/getContentWbaseballList : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<ContentSport> sportList = contentSportService.getContentSportWbaseballList(0);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/sportWBaseball.jsp");
		
		return modelAndView;
	}
	
	/*농구*/
	@RequestMapping(value="getContentBasketballList", method=RequestMethod.GET)
	public ModelAndView getContentBasketballList(HttpSession session)throws Exception  {		
		
		System.out.println("contentSport/getContentBasketballList : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<ContentSport> sportList = contentSportService.getContentSportBasketballList(0);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/sportBasketball.jsp");
		
		return modelAndView;
	}
	
	/*일반*/
	@RequestMapping(value="getContentGeneralList", method=RequestMethod.GET)
	public ModelAndView getContentGeneralList(HttpSession session)throws Exception  {		
		
		System.out.println("contentSport/getContentGeneralList : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo : "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<ContentSport> sportList = contentSportService.getContentSportGeneralList(0);
		
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentSport" , sportList);
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/sportGeneral.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="getContentHighlightList", method=RequestMethod.GET)
	public ModelAndView getContenntHighlightList(HttpSession session)throws Exception{
		
		System.out.println("contentSport/getContentHighlightList : GET");
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNo: "+userNo);
		
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		System.out.println("contentSetting"+contentSetting);
		
		List<ContentSport> sportList = contentSportService.getContentSportHighlightList(0);
		
		ModelAndView modelAndView = new	 ModelAndView();
		modelAndView.addObject("contentSport", sportList);
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/sportHighlight.jsp");
		
		return modelAndView;
	}
	
}
