package com.tmmmi.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.common.Page;
import com.tmmmi.common.Search;
import com.tmmmi.service.domain.FAQ;
import com.tmmmi.service.faq.FAQService;

@Controller
@RequestMapping("/faq/*")
public class FAQController {
	
	@Autowired
	@Qualifier("faqServiceImpl")
	private FAQService faqService;
	
	public FAQController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value="addFAQ", method=RequestMethod.GET )
	public ModelAndView addFAQ() throws Exception {
		System.out.println("/FAQ/addFAQ : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/FAQ/addFAQ.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addFAQ", method=RequestMethod.POST )
	public ModelAndView addFAQ(@ModelAttribute("faq") FAQ faq) throws Exception {
		System.out.println("/FAQ/addFAQ : POST");
		
		ModelAndView modelAndView = new ModelAndView();
		faqService.addFAQ(faq);
		modelAndView.setViewName("/faq/getFAQList");
		return modelAndView;
	}
	
	@RequestMapping(value="getFAQList" )
	public ModelAndView getFAQList(@ModelAttribute("search") Search search) throws Exception{
		
		System.out.println("/FAQ/getFAQList : GET/POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		if(search.getSearchCondition() == null & search.getSearchKeyword() == null) {
			search.setSearchCondition("0");
			search.setSearchKeyword("");
		}
		
		Map<String, Object> map = faqService.getFAQList(search);
		System.out.println("map :: " +map);
		
		Page resultPage = new Page(search.getCurrentPage(),  ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		System.out.println(map.get("list"));
	
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		
		modelAndView.setViewName("/FAQ/listFAQ.jsp");
		return modelAndView;
	}
	
	public void updateFAQ() {}
	public void deleteFAQ() {}
	
}
