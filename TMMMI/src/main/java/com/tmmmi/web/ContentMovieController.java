package com.tmmmi.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.contentsetting.ContentSettingService;
import com.tmmmi.service.usersetting.UserSettingService;

@Controller
@RequestMapping("/contentMovie/*")
public class ContentMovieController {
	
	@Autowired
	@Qualifier("contentMovieServiceImpl")
	private ContentService contentMovieService;
	
	@Autowired
	@Qualifier("userSettingServiceImpl")
	private UserSettingService userSettingService;
	
	public ContentMovieController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="getContentMovieBoxOffice", method=RequestMethod.GET)
	public ModelAndView getBoxOfficeList(HttpSession session) throws Exception {
		int userNo = (int)session.getAttribute("userNo");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentMovieBoxOfficeList", contentMovieService.getContentMovieBoxOfficeList(0));
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/movieBoxOffice.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getContentMovieNew", method=RequestMethod.GET)
	public ModelAndView getNewMovieList(HttpSession session) throws Exception {
		int userNo = (int)session.getAttribute("userNo");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentMovieNewMovieList", contentMovieService.getContentMovieNewList(0));
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/movieNew.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getContentMovieUpcoming", method=RequestMethod.GET)
	public ModelAndView getUpcomingMovieList(HttpSession session) throws Exception {
		int userNo = (int)session.getAttribute("userNo");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentMovieUpcomingMovieList", contentMovieService.getContentMovieUpcomingList(0));
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/movieUpcoming.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getContentMovieReview", method=RequestMethod.GET)
	public ModelAndView getMovieReviewList(HttpSession session) throws Exception {
		int userNo = (int)session.getAttribute("userNo");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentMovieReviewList", contentMovieService.getContentMovieReviewList(0));
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/movieReview.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getContentMovieTrailer", method=RequestMethod.GET)
	public ModelAndView getMovieTrailerList(HttpSession session) throws Exception {
		int userNo = (int)session.getAttribute("userNo");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentMovieTrailerList", contentMovieService.getContentMovieTrailerList(0));
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/movieTrailer.jsp");
		return modelAndView;
	}
}
