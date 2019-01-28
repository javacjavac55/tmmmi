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
import com.tmmmi.service.user.UserService;

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
	
	@RequestMapping(value="getShoppingList", method=RequestMethod.GET)
	public ModelAndView getShoppingList(HttpSession session) throws Exception{
		System.out.println("getShoppingList controller 실행!");
		
		int userNo = (int)session.getAttribute("userNo");		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("shoppingContentFirstList", shoppingContentService.getContentShoppingFirstList(contentSettingService.getContentSetting(userNo), 0));
		modelAndView.addObject("shoppingContentSecondList", shoppingContentService.getContentShoppingSecondList(contentSettingService.getContentSetting(userNo), 0));
		modelAndView.addObject("shoppingContentThirdList", shoppingContentService.getContentShoppingThirdList(contentSettingService.getContentSetting(userNo), 0));
		modelAndView.setViewName("/content/shoppingContent.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getShoppingReviewList", method=RequestMethod.GET)
	public ModelAndView getShoppingReviewList(HttpSession session) throws Exception{
		System.out.println("getShoppingReviewList controller 실행!");
		
		int userNo = (int)session.getAttribute("userNo");	
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("shoppingContentReviewList", shoppingContentService.getContentShoppingReviewList(contentSettingService.getContentSetting(userNo), 0));
		modelAndView.setViewName("/content/shoppingReviewContent.jsp");
		return modelAndView;
	}

}
