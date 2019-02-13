package com.tmmmi.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.domain.Scrap;
import com.tmmmi.service.scrap.ScrapService;

@RestController
@RequestMapping("/scrapRest/*")
public class ScrapRestController {
	
	@Autowired
	@Qualifier("scrapServiceImpl")
	private ScrapService scrapService;
	
	public ScrapRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping( value="addScrap", method=RequestMethod.POST )
	public void addScrap(@RequestBody Scrap scrap, HttpSession session) throws Exception {
		System.out.println(scrap.getSectionNo() + " : " + scrap.getScrapLink());
		scrap.setUserNo((int)session.getAttribute("userNo"));
		System.out.println("result:"+scrapService.addScrap(scrap));
	}
	
	@RequestMapping( value="addScrapLink", method=RequestMethod.POST )
	public void addScrapLink(@RequestBody Scrap scrap, HttpSession session) throws Exception {
		System.out.println(scrap.getSectionNo() + " : " + scrap.getScrapLink());
		scrap.setUserNo((int)session.getAttribute("userNo"));
		System.out.println("result:"+scrapService.addScrapLink(scrap));
	}
	
	@RequestMapping(value="getScrap", method=RequestMethod.GET)
	public Scrap getScrap(@RequestParam("scrapNo") int scrapNo)throws Exception {
		System.out.println("/diary/getScrap: GET");			
		return scrapService.getScrap(scrapNo);		
	}
}
