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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.common.Page;
import com.tmmmi.common.Search;
import com.tmmmi.service.faq.FAQService;
import com.tmmmi.service.user.UserService;

@RestController
@RequestMapping("/faqRest/*")
public class FAQRestController {
	
	@Autowired
	@Qualifier("faqServiceImpl")
	private FAQService faqService;

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public FAQRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="imageFAQ", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public void profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("실행");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		/*String realFolder = request.getSession().getServletContext().getRealPath("C:\\Users\\Bit\\git\\tmmmi\\TMMMI\\WebContent\\resources\\images\\diaryImage");*/
		String realFolder = "C:\\Users\\Bit\\git\\tmmmi\\TMMMI\\WebContent\\resources\\images\\FAQImage";
		
		
		String orgFilename = file.getOriginalFilename();
		String strFilename = System.currentTimeMillis()+"."+file.getOriginalFilename().split("\\.")[1];
		
		System.out.println("원본 파일명 : "+ orgFilename);
		System.out.println("저장할 파일명: "+ strFilename);
		
		String filepath = realFolder + "\\"+strFilename;
		System.out.println("파일경로 : "+filepath);
		
		File f = new File(filepath);
		
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("/images/FAQImage/"+strFilename);
		out.close();
		
	}
	
	@RequestMapping( value="json/getFAQList/")
	public ModelAndView  getFAQList(@RequestBody Search search, 
																HttpSession session) throws Exception{
		
		System.out.println("json/FAQ/getFAQList : GET/POST");
			
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
		modelAndView.setViewName("/FAQ/FAQTable.jsp");
		return modelAndView;
	}

}
