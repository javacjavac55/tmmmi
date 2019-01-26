package com.tmmmi.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.contentsetting.ContentSettingService;

@Controller
@RequestMapping("/contentShopping/*")
public class ContentShoppingController {
	
	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	@Autowired
	@Qualifier("contentShoppingServiceImpl")
	private ContentService shoppingContentService;
	
	public ContentShoppingController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="shoppingContent", method=RequestMethod.GET)
	public ModelAndView getShoppingList() throws Exception{
		
		System.out.println("content shopping controller ½ÇÇà!");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("shoppingContentList", shoppingContentService.getContentShoppingFirstList(null, 0));
		modelAndView.setViewName("/content/shoppingContent.jsp");
		return modelAndView;
	}

}
