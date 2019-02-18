package com.tmmmi.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	
	@Value("#{commonProperties['userCenterPageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['userCenterPageSize']}")
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
		System.out.println(userNo);
		modelAndView.addObject("role", userService.getUser(userNo).getRole());
		System.out.println(userService.getUser(userNo).getRole());
		modelAndView.setViewName("/FAQ/listFAQ.jsp");
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
	
	@RequestMapping(value = "imageFAQ", method = RequestMethod.POST)
    public void imageFAQ(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
	 	
        OutputStream out = null;
        PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
 
        try{
            String fileName = System.currentTimeMillis() + "." +upload.getOriginalFilename().split("\\.")[1];
            byte[] bytes = upload.getBytes();
            String uploadPath = "C:\\Users\\Bit\\git\\tmmmi\\TMMMI\\WebContent\\resources\\images\\FAQImage\\" + fileName;//저장경로
            
            File file = new File(uploadPath);
            out = new FileOutputStream(file);
            out.write(bytes);
             
            printWriter = response.getWriter();
            String fileUrl = "/images/FAQImage/" + fileName;//url경로
 
           printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("+1+ ",'"+fileUrl+ "',''"+ ");\n</script>");
            //printWriter.write("{\"uploaded\": 1,\"fileName\": \""+fileName+"\", \"url \" :"+"\"http://192.168.0.53:8080/images/diaryImage/"+fileName+"\"}");
            printWriter.flush();
 
        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return;
    }
}
