package com.tmmmi.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.content.ContentService;
import com.tmmmi.service.contentsetting.ContentSettingService;
import com.tmmmi.service.domain.ContentMovie;
import com.tmmmi.service.domain.ContentSetting;
import com.tmmmi.service.domain.ContentShopping;
import com.tmmmi.service.user.UserService;
import com.tmmmi.service.usersetting.UserSettingService;

@RestController
@RequestMapping("/contentShoppingRest/*")
public class ContentShoppingRestController {

	@Autowired
	@Qualifier("contentSettingServiceImpl")
	private ContentSettingService contentSettingService;
	
	@Autowired
	@Qualifier("contentShoppingServiceImpl")
	private ContentService shoppingContentService;
	
	@Autowired
	@Qualifier("userSettingServiceImpl")
	private UserSettingService userSettingService;
	
	public ContentShoppingRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="getShoppingListFirst", method=RequestMethod.GET)
	public List<ContentShopping> getShoppingListFirst(@RequestParam("index") int index, HttpSession session) throws Exception {
		int userNo = (int)session.getAttribute("userNo");
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		
		return shoppingContentService.getContentShoppingFirstList(contentSetting, index);
	}
	
	@RequestMapping(value="getContentShoppingSecondList", method=RequestMethod.GET)
	public List<ContentShopping> getContentShoppingSecondList(@RequestParam("index") int index, HttpSession session) throws Exception {
		
		int userNo = (int)session.getAttribute("userNo");
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		
		return shoppingContentService.getContentShoppingSecondList(contentSetting, index);
	}
	
	@RequestMapping(value="getContentShoppingThirdList", method=RequestMethod.GET)
	public List<ContentShopping> getContentShoppingThirdList(@RequestParam("index") int index, HttpSession session) throws Exception {
		
		int userNo = (int)session.getAttribute("userNo");
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);
		
		return shoppingContentService.getContentShoppingThirdList(contentSetting, index);
	}
	
	@RequestMapping(value="getContentShoppingReviewList", method=RequestMethod.GET)
	public List<ContentShopping> getContentShoppingReviewList(@RequestParam("index") int index, @RequestParam("pageToken") String pageToken, HttpSession session) throws Exception {
		
		int userNo = (int)session.getAttribute("userNo");
		ContentSetting contentSetting = contentSettingService.getContentSetting(userNo);

		return shoppingContentService.getContentShoppingReviewList(contentSetting, index, pageToken);
	}

}
