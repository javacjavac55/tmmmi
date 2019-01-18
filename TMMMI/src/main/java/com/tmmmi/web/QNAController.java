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
import com.tmmmi.service.domain.QNA;
import com.tmmmi.service.qna.QNAService;
import com.tmmmi.service.user.UserService;

@Controller
@RequestMapping("/qna/*")
public class QNAController {
	
	@Autowired
	@Qualifier("qnaServiceImpl")
	private QNAService qnaService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public QNAController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="addQNA", method=RequestMethod.GET )
	public ModelAndView addQNA(HttpSession session) throws Exception {
		System.out.println("/QNA/addQNA : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		//userNo session으로 받아오기 &userId만 빼오기
		//문의글 작성 페이지에서 userId가 필요함
		int userNo = (int) session.getAttribute("userNo");
		modelAndView.addObject("userId", userService.getUser(userNo).getUserId() );
		modelAndView.setViewName("/QNA/addQNA.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addQNA", method=RequestMethod.POST )
	public ModelAndView addQNA(@ModelAttribute("qna") QNA qna,HttpSession session) throws Exception {
		System.out.println("/QNA/addQNA : POST");
		
		int userNo = (int) session.getAttribute("userNo");
		qna.setUserNo(userNo);
		qnaService.addQNA(qna);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/qna/getQNAList");
		return modelAndView;
	}
	
	@RequestMapping(value="getQNA" )
	public ModelAndView getQNA(HttpSession session,  @RequestParam("qnaNo") int qnaNo) throws Exception {
		System.out.println("/QNA/getQNA : GET/POST");
		
		ModelAndView modelAndView = new ModelAndView();
		//문의글 작성페이지에서 userId 필요 
		int userNo = (int)session.getAttribute("userNo");
		modelAndView.addObject("userId", userService.getUser(userNo).getUserId() );
		modelAndView.addObject("role", userService.getUser(userNo).getRole());
		
		QNA qna = qnaService.getQNA(qnaNo);
		modelAndView.addObject("qna", qna);
		modelAndView.setViewName("/QNA/getQNA.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getQNAList" )
	public ModelAndView getQNAList(@ModelAttribute("search") Search search, HttpSession session) throws Exception{
		System.out.println("/QNA/getQNAList : GET/POST");
		
		int userNo = (int)session.getAttribute("userNo");
		System.out.println("userNo::::" +userNo);
	
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
				
		Map<String, Object> map = qnaService.getQNAList(search, userNo);
		Page resultPage = new Page(search.getCurrentPage(),  ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		
		System.out.println("333333333");
		modelAndView.setViewName("/QNA/listQNA.jsp");
		return modelAndView;
	}
		
	@RequestMapping(value="updateQNA", method=RequestMethod.GET )
	public ModelAndView updateQNA( @RequestParam("qnaNo") int qnaNo) throws Exception{
		System.out.println("/QNA/updateQNA : GET");

		QNA qna = qnaService.getQNA(qnaNo);
		
		ModelAndView modelAndView = new ModelAndView();		
		modelAndView.addObject("qna", qna);
		modelAndView.setViewName("/QNA/updateQNA.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="updateQNA", method=RequestMethod.POST )
	public ModelAndView updateQNA(@ModelAttribute("qna") QNA qna) throws Exception{
		System.out.println("/QNA/updateQNA : POST");
		
		qnaService.updateQNA(qna);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/qna/getQNA?qnaNo="+qna.getQNANo());
		return modelAndView;
	}
	
	@RequestMapping(value="addQNAAnswer", method=RequestMethod.GET )
	public ModelAndView addQNAAnswer(@RequestParam("qnaNo") int qnaNo) throws Exception{
		System.out.println("/QNA/addQNAAnswer : GET");
		
		QNA qna = qnaService.getQNA(qnaNo);
	
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("qna", qna);
		modelAndView.setViewName("/QNA/addQNAAnswer.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addQNAAnswer", method=RequestMethod.POST )
	public ModelAndView addQNAAnswer(@ModelAttribute("qna") QNA qna)throws Exception{
		System.out.println("/QNA/addQNAAnswer : POST");
	
		qnaService.addQNAAnswer(qna);
				
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/qna/getQNA?qnaNo="+qna.getQNANo());
		return modelAndView;
	}
	
	@RequestMapping(value="updateQNAAnswer", method=RequestMethod.GET )
	public ModelAndView updateQNAAnswer(@RequestParam("qnaNo") int qnaNo) throws Exception{
		System.out.println("/QNA/updateQNAAnswer : GET");
		
		QNA qna = qnaService.getQNA(qnaNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("qna", qna);
		modelAndView.setViewName("/QNA/addQNAAnswer.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="updateQNAAnswer", method=RequestMethod.POST )
	public ModelAndView updateQNAAnswer(@ModelAttribute("qna") QNA qna)throws Exception{
		System.out.println("/QNA/updateQNAAnswer : POST");
		
		qnaService.addQNAAnswer(qna);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/qna/getQNA?qnaNo="+qna.getQNANo());
		return modelAndView;
	}
	
}
