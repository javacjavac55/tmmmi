package com.tmmmi.web;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.tmmmi.service.faq.FAQService;

@RestController
@RequestMapping("/faqRest/*")
public class FAQRestController {
	
	@Autowired
	@Qualifier("faqServiceImpl")
	private FAQService faqService;
	
	public FAQRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
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

}
