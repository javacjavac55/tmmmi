package com.tmmmi.web;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.common.Page;
import com.tmmmi.common.Search;
import com.tmmmi.service.domain.Scrap;
import com.tmmmi.service.scrap.ScrapService;

@Controller
@RequestMapping("/scrap/*")
public class ScrapController {
	
	@Autowired
	@Qualifier("scrapServiceImpl")
	private ScrapService scrapService;
	
	public ScrapController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	

	
	@RequestMapping(value="getScrap", method=RequestMethod.GET)
	public ModelAndView getScrap(@RequestParam("scrapNo") int scrapNo)throws Exception {
		System.out.println("/diary/getScrap: GET");
		
	
		Scrap scrap = scrapService.getScrap(scrapNo);
		
		scrap.setScrapCheck(1);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("scrap", scrap);
		modelAndView.setViewName("/scrap/getScrap.jsp");
		
		return modelAndView;		
	}
	
	@RequestMapping(value="getScrapList")
	public ModelAndView getScrapList(@ModelAttribute("search") Search search, @ModelAttribute("Scrap") Scrap scrap, HttpSession session)throws Exception{
		int userNo = (int)session.getAttribute("userNo");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map= scrapService.getScrapList(search, userNo);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("/scrap/listScrap.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="deleteScrap", method=RequestMethod.POST)
	public ModelAndView deleteScrap(@RequestParam("deleteScrap") String scrapNo)  throws Exception{
		
		System.out.println("/scrap/deleteScrap");
		System.out.println("스크랩 번호:"+scrapNo);
		
		String[] arrIdx =  scrapNo.split(",");
		for (int i=0; i<arrIdx.length; i++) {
			scrapService.deleteScrap(Integer.parseInt(arrIdx[i]));
		}	
				
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/scrap/getScrapList");
		
		return modelAndView;
	}
}
