package com.tmmmi.web;

import java.util.Map;

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
import com.tmmmi.service.domain.QNA;
import com.tmmmi.service.qna.QNAService;

@Controller
@RequestMapping("/qna/*")
public class QNAController {
	
	@Autowired
	@Qualifier("qnaServiceImpl")
	private QNAService qnaService;
	
	public QNAController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="addQNA", method=RequestMethod.GET )
	public ModelAndView addQNA() throws Exception {
		System.out.println("/QNA/addQNA : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/QNA/addQNA.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addQNA", method=RequestMethod.POST )
	public ModelAndView addQNA(@ModelAttribute("qna") QNA qna) throws Exception {
		System.out.println("/QNA/addQNA : POST");
		
		ModelAndView modelAndView = new ModelAndView();
		qnaService.addQNA(qna);
		modelAndView.setViewName("/qna/getQNA");
		return modelAndView;
	}
	
	@RequestMapping(value="getQNA")
	public ModelAndView getQNA(@RequestParam("userNo") int userNo) throws Exception {
		System.out.println("/QNA/getQNA : GET");
		System.out.println(userNo);
		QNA qna = qnaService.getQNA(userNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("qna", qna);
		modelAndView.setViewName("/qna/getQNA.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="getQNAList" )
	public ModelAndView getQNAList(@ModelAttribute("search") Search search) throws Exception{
		
		System.out.println("/QNA/getQNAList : GET/POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		if(search.getSearchCondition() == null & search.getSearchKeyword() == null) {
			search.setSearchCondition("0");
			search.setSearchKeyword("");
		}
		
		Map<String, Object> map = qnaService.getQNAList(search);
		Page resultPage = new Page(search.getCurrentPage(),  ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		System.out.println("map.get::::" +map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		
		modelAndView.setViewName("/QNA/listQNA.jsp");
		return modelAndView;
	}
	
	
	public void updateQNA() {}
	public void addQNAAnswer() {}
	public void updateQNAAnswer() {}
}
