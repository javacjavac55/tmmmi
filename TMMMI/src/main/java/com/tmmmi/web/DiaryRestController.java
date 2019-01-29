package com.tmmmi.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sun.media.jfxmedia.logging.Logger;
import com.tmmmi.service.diary.DiaryService;

@Controller
@RequestMapping("/diaryRest/*")
public class DiaryRestController {

	@Autowired
	@Qualifier("diaryServiceImpl")
	private DiaryService diaryService;

	public DiaryRestController() {
		System.out.println(this.getClass());
	}

	/*@RequestMapping(value = "imageDiary", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public void profileUpload(MultipartFile file, MultipartHttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("실행");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String realFolder = request.getSession().getServletContext()
				.getRealPath("C:\\Users\\Bit\\git\\tmmmi\\TMMMI\\WebContent\\resources\\images\\diaryImage");
		String realFolder = "C:\\Users\\Bit\\git\\tmmmi\\TMMMI\\WebContent\\resources\\images\\diaryImage";

		String orgFilename = file.getOriginalFilename();
		String strFilename = System.currentTimeMillis() + "." + file.getOriginalFilename().split("\\.")[1];

		System.out.println("원본 파일명 : " + orgFilename);
		System.out.println("저장할 파일명: " + strFilename);

		String filepath = realFolder + "\\" + strFilename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);

		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("/images/diaryImage/" + strFilename);
		out.close();

	}*/
	
	/*@RequestMapping(value = "imageDiary", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String imageDiary(MultipartHttpServletRequest request) throws Exception {
		MultiValueMap<String, MultipartFile> multiFileMap = request.getMultiFileMap();
		List<MultipartFile> list = multiFileMap.get(FILE2);
		MultipartFile multipartFile = list.get(0);

		String orgFilename = multipartFile.getOriginalFilename();
		String strFilename = System.currentTimeMillis() + "." + multipartFile.getOriginalFilename().split("\\.")[1];
		File file = new File(strFilename);
		multipartFile.transferTo(file);

		String localIP = InetAddress.getLocalHost().getHostAddress();

		return "http://" + localIP + ":" + request.getServerPort() + strFilename;
	}*/
}
