package com.tmmmi.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.contentsetting.ContentSettingService;
import com.tmmmi.service.domain.ContentMovie;
import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentSport;
import com.tmmmi.service.domain.UserSetting;
import com.tmmmi.service.usersetting.UserSettingService;

@RestController
@RequestMapping("/contentMovieRest/*")
public class ContentMovieRestController {
	
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	@Autowired
	@Qualifier("contentMovieServiceImpl")
	private ContentService contentMovieService;
	
	public ContentMovieRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="getContentMovieBoxOffice", method=RequestMethod.GET)
	public List<ContentMovie> getBoxOfficeList(@RequestParam("index") int index, HttpSession session) throws Exception {
		return contentMovieService.getBoxOfficeList(index);
	}
	
	@RequestMapping(value="getContentMovieNew", method=RequestMethod.GET)
	public List<ContentMovie> getNewMovieList(@RequestParam("index") int index, HttpSession session) throws Exception {
		return contentMovieService.getNewMovieList(index);
	}
	
	@RequestMapping(value="getContentMovieUpcoming", method=RequestMethod.GET)
	public List<ContentMovie> getUpcomingMovieList(@RequestParam("index") int index, HttpSession session) throws Exception {
		return contentMovieService.getUpcomingMovieList(index);
	}
	
	@RequestMapping(value="getContentMovieReview", method=RequestMethod.GET)
	public List<ContentMovie> getMovieReviewList(@RequestParam("index") int index, HttpSession session) throws Exception {
		return contentMovieService.getMovieReviewList(index);
	}
	
	@RequestMapping(value="getContentMovieTrailer", method=RequestMethod.GET)
	public List<ContentMovie> getMovieTrailerList(@RequestParam("index") int index, HttpSession session) throws Exception {
		return contentMovieService.getMovieTrailerList(index);
	}
}
