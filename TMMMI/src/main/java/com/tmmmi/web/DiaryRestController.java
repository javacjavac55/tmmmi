package com.tmmmi.web;

import java.io.File;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.tmmmi.service.diary.DiaryService;

@RestController
@RequestMapping("/diaryRest/*")
public class DiaryRestController {
	
	@Autowired
	@Qualifier("diaryServiceImpl")
	private DiaryService diaryService;
	
	
	public DiaryRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="imageDiary", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public void profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("����");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		/*String realFolder = request.getSession().getServletContext().getRealPath("C:\\Users\\Bit\\git\\tmmmi\\TMMMI\\WebContent\\resources\\images\\diaryImage");*/
		String realFolder = "C:\\Users\\Bit\\git\\tmmmi\\TMMMI\\WebContent\\resources\\images\\diaryImage";
		
		
		String orgFilename = file.getOriginalFilename();
		String strFilename = System.currentTimeMillis()+"."+file.getOriginalFilename().split("\\.")[1];
		
		System.out.println("���� ���ϸ� : "+ orgFilename);
		System.out.println("������ ���ϸ�: "+ strFilename);
		
		String filepath = realFolder + "\\"+strFilename;
		System.out.println("���ϰ�� : "+filepath);
		
		File f = new File(filepath);
		
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("/images/diaryImage/"+strFilename);
		out.close();
		
	}

}
