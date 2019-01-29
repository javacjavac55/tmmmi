package com.tmmmi.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.contentsetting.ContentSettingService;
import com.tmmmi.service.domain.ContentSetting;

@Controller
@RequestMapping("/contentMovie/*")
public class ContentMovieController {
	
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	@Autowired
	@Qualifier("contentMovieServiceImpl")
	private ContentService contentMovieService;
	
	public ContentMovieController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="getContentMovieBoxOffice", method=RequestMethod.GET)
	public ModelAndView getBoxOfficeList() throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentMovieBoxOfficeList", contentMovieService.getBoxOfficeList(null, 0));
		modelAndView.setViewName("/content/contentMovieBoxOffice.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getContentMovieNew", method=RequestMethod.GET)
	public ModelAndView getNewMovieList() throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentMovieNewMovieList", contentMovieService.getNewMovieList(null, 0));
		modelAndView.setViewName("/content/contentMovieNewMovie.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getContentMovieUpcoming", method=RequestMethod.GET)
	public ModelAndView getUpcomingMovieList() throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentMovieUpcomingMovieList", contentMovieService.getUpcomingMovieList(null, 0));
		modelAndView.setViewName("/content/contentMovieUpcomingMovie.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getContentMovieReview", method=RequestMethod.GET)
	public ModelAndView getMovieReviewList() throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentMovieReviewList", contentMovieService.getMovieReviewList(null, 0));
		modelAndView.setViewName("/content/contentMovieReview.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getContentMovieTrailer", method=RequestMethod.GET)
	public ModelAndView getMovieTrailerList() throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("contentMovieTrailerList", contentMovieService.getMovieTrailerList(null, 0));
		modelAndView.setViewName("/content/contentMovieTrailer.jsp");
		return modelAndView;
	}
}
