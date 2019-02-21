package com.tmmmi.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.contentsetting.ContentSettingService;
import com.tmmmi.service.domain.ContentSport;

@RestController
@RequestMapping("/contentSportRest/*")
public class ContentSportRestController {
	
	@Autowired
	@Qualifier("contentSportServiceImpl")
	private ContentService contentSportService;	
	
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	public ContentSportRestController() {
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
	public List<ContentSport> getContentKsoccerList(@RequestParam("index") int index, HttpSession session)throws Exception  {
		System.out.println("contentSportRest/getContentKsoccerList : GET");				
		return contentSportService.getContentSportKsoccerList(index);
	}
	
	/*해외축구*/
	@RequestMapping(value="getContentWsoccerList", method=RequestMethod.GET)
	public List<ContentSport> getContentWsoccerList(@RequestParam("index") int index, HttpSession session)throws Exception  {				
		System.out.println("contentSportRest/getContentWsoccerList : GET");
		return contentSportService.getContentSportWsoccerList(index);
	}
	
	/*국내야구*/
	@RequestMapping(value="getContentKbaseballList", method=RequestMethod.GET)
	public List<ContentSport> getContentKbaseballList(@RequestParam("index") int index, HttpSession session)throws Exception  {		
		
		System.out.println("contentSportRest/getContentKbaseballList : GET");	
		return contentSportService.getContentSportKbaseballList(index);
	}
	
	/*해외야구*/
	@RequestMapping(value="getContentWbaseballList", method=RequestMethod.GET)
	public List<ContentSport> getContentWbaseballList(@RequestParam("index") int index, HttpSession session)throws Exception  {		
		
		System.out.println("contentSportRest/getContentWbaseballList : GET");		
		return contentSportService.getContentSportWbaseballList(index);
	}
	
	/*농구*/
	@RequestMapping(value="getContentBasketballList", method=RequestMethod.GET)
	public List<ContentSport> getContentBasketballList(@RequestParam("index") int index, HttpSession session)throws Exception  {	
		System.out.println("contentSportRest/getContentBasketballList : GET");		
		return contentSportService.getContentSportBasketballList(index);
	}
	
	/*일반*/
	@RequestMapping(value="getContentGeneralList", method=RequestMethod.GET)
	public List<ContentSport> getContentGeneralList(@RequestParam("index") int index, HttpSession session)throws Exception  {
		
		System.out.println("contentSportRest/getContentGeneralList : GET");
		return contentSportService.getContentSportGeneralList(index);
	}
	
	
	/*하이라이트리스트*/
	@RequestMapping(value="getContentHighlightList", method=RequestMethod.GET)
	public List<ContentSport> getContentHighlightList(@RequestParam("index") int index, HttpSession session)throws Exception{		
		System.out.println("contentSportRest/getContentHighlightList : GET");		
		return contentSportService.getContentSportHighlightList(index);
	}
	
	@RequestMapping(value="getContentHighlightVideo", method=RequestMethod.POST)
	public ContentSport getContentHighlightVideo(@RequestBody ContentSport sport )throws Exception{
		System.out.println("contentSport/getContentHighlightVideo : POST");
		return contentSportService.getContentSportHighlightVideo(sport);
	}
	
}
