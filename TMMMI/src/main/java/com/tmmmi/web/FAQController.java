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
import com.tmmmi.service.domain.FAQ;
import com.tmmmi.service.faq.FAQService;
import com.tmmmi.service.user.UserService;

@Controller
@RequestMapping("/faq/*")
public class FAQController {
	
	@Autowired
	@Qualifier("faqServiceImpl")
	private FAQService faqService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
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
		
		faqService.addFAQ(faq);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/faq/getFAQList");
		return modelAndView;
	}
	
	
	@RequestMapping(value="getFAQList" )
	public ModelAndView getFAQList(@ModelAttribute("search") Search search, HttpSession session) throws Exception{
		
		System.out.println("/FAQ/getFAQList : GET/POST");
			
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		if(search.getSearchKeyword() != null) {
			search.setSearchCondition("0");
		}
		
		Map<String, Object> map = faqService.getFAQList(search);
		Page resultPage = new Page(search.getCurrentPage(),  ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		System.out.println("map.get::::" +map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		
		int userNo = (int)session.getAttribute("userNo");
		modelAndView.addObject("role", userService.getUser(userNo).getRole());
		
		modelAndView.setViewName("/FAQ/listFAQ.jsp");
		System.out.println("³¡");
		return modelAndView;
	}
	
	@RequestMapping(value="updateFAQ", method=RequestMethod.GET )
	public ModelAndView updateFAQ(@RequestParam("faqNo") int faqNo) throws Exception {
		System.out.println("/FAQ/updateFAQ : GET");
		
		FAQ faq = faqService.getFAQ(faqNo);
		System.out.println(faq);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("faq", faq);
		modelAndView.setViewName("/FAQ/updateFAQ.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="updateFAQ", method=RequestMethod.POST )
	public ModelAndView updateFAQ(@ModelAttribute("faq") FAQ faq, @RequestParam("faqNo") int faqNo) throws Exception {
		System.out.println("/FAQ/updateFAQ : POST");
		
		faq.setFAQNo(faqNo);
		faqService.updateFAQ(faq);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/faq/getFAQList");
		return modelAndView;
	}
	
	@RequestMapping(value="deleteFAQ")
	public ModelAndView deleteFAQ(@ModelAttribute("faq") FAQ faq, @RequestParam("faqNo") int faqNo) throws Exception {
		System.out.println("/FAQ/deleteFAQ : GET/POST");

		ModelAndView modelAndView = new ModelAndView();
		faq.setFAQNo(faqNo);
		faqService.deleteFAQ(faq);
		
		modelAndView.setViewName("redirect:/faq/getFAQList");
		return modelAndView;
	}
	
}
