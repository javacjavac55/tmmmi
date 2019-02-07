package com.tmmmi.web;

import java.io.File;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.common.Page;
import com.tmmmi.common.Search;
import com.tmmmi.service.qna.QNAService;
import com.tmmmi.service.user.UserService;

@RestController
@RequestMapping("/qnaRest/*")
public class QNARestController {
	
	@Autowired
	@Qualifier("qnaServiceImpl")
	private QNAService qnaService;

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public QNARestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping( value="json/getQNASearchList/" )
	public ModelAndView  getQNASearchList(@RequestBody Search search, 
																HttpSession session) throws Exception{
		
		System.out.println("json/QNA/getQNASearchList : POST");
		
		int userNo = (int)session.getAttribute("userNo");
		System.out.println("userNo::::" +userNo);
		int role = userService.getUser(userNo).getRole();
			
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		if(search.getSearchKeyword() != null) {
			search.setSearchCondition("0");
		}
		
		Map<String, Object> map;
		ModelAndView modelAndView = new ModelAndView();
		
		if(role == 0) {
			map = qnaService.getAdminQNAList(search);
		}else {
			map = qnaService.getQNAList(search, userNo);
		}
		
		Page resultPage = new Page(search.getCurrentPage(),  ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
	
		modelAndView.setViewName("/QNA/listQNA.jsp");
		return modelAndView;
	}
	
	@RequestMapping( value="json/getQNAList/{currentPage}")
	public ModelAndView  getQNAList(@ModelAttribute Search search, 
																HttpSession session) throws Exception{
		
		System.out.println("json/QNA/getQNAList : GET");
		
		int userNo = (int)session.getAttribute("userNo");
		System.out.println("userNo::::" +userNo);
		int role = userService.getUser(userNo).getRole();
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		if(search.getSearchKeyword() != null) {
			search.setSearchCondition("0");
		}
		
		Map<String, Object> map;
		ModelAndView modelAndView = new ModelAndView();
		
		//admin
		if(role == 0) {
			map = qnaService.getAdminQNAList(search);
		}else {
			map = qnaService.getQNAList(search, userNo);
		}
		
		Page resultPage = new Page(search.getCurrentPage(),  ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
	
		modelAndView.setViewName("/QNA/QNATable.jsp");
		return modelAndView;
	}

}
