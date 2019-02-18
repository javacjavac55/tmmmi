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
@RequestMapping("/contentShopping/*")
public class ContentShoppingController {

	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	@Autowired
	@Qualifier("contentShoppingServiceImpl")
	private ContentService shoppingContentService;
	
	@Autowired
	@Qualifier("userSettingServiceImpl")
	private UserSettingService userSettingService;
	
	public ContentShoppingController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="getShoppingListFirst", method=RequestMethod.GET)
	public ModelAndView getShoppingListFirst(HttpSession session) throws Exception{
		System.out.println("getShoppingList controller 角青!");
		
		int userNo = (int)session.getAttribute("userNo");		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("shoppingContentFirstList", shoppingContentService.getContentShoppingFirstList(contentSettingService.getContentSetting(userNo), 0));
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/shoppingContentFirst.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getShoppingListSecond", method=RequestMethod.GET)
	public ModelAndView getShoppingListSecond(HttpSession session) throws Exception{
		System.out.println("getShoppingList controller 角青!");
		
		int userNo = (int)session.getAttribute("userNo");		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("shoppingContentSecondList", shoppingContentService.getContentShoppingSecondList(contentSettingService.getContentSetting(userNo), 0));
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/shoppingContentSecond.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getShoppingListThird", method=RequestMethod.GET)
	public ModelAndView getShoppingListThird(HttpSession session) throws Exception{
		System.out.println("getShoppingList controller 角青!");
		
		int userNo = (int)session.getAttribute("userNo");		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("shoppingContentThirdList", shoppingContentService.getContentShoppingThirdList(contentSettingService.getContentSetting(userNo), 0));
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/shoppingContentThird.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getShoppingReviewList", method=RequestMethod.GET)
	public ModelAndView getShoppingReviewList(HttpSession session) throws Exception{
		System.out.println("getShoppingReviewList controller 角青!");
		
		int userNo = (int)session.getAttribute("userNo");	
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("shoppingContentReviewList", shoppingContentService.getContentShoppingReviewList(contentSettingService.getContentSetting(userNo), 0, null));
		modelAndView.addObject("bgColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#000000":"#FFFFFF");
		modelAndView.addObject("fontColor", (userSettingService.getUserSetting(userNo).getMainColorModeNo()==0)?"#FFFFFF":"#000000");
		modelAndView.setViewName("/content/shoppingReviewContent.jsp");
		return modelAndView;
	}

}
