package com.tmmmi.web;

import java.util.Map;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.tmmmi.common.Page;
import com.tmmmi.common.Search;
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
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	/*
	@RequestMapping(value = "listImage")
	public Map listImage(@RequestBody(required=false) Search search, HttpSession session)throws Exception {
		System.out.println("서치 :" +search);
		int userNo = ((int)session.getAttribute("userNo"));

		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		//search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);		
		// Business logic 수행
		Map<String , Object> map=diaryService.getDiaryList(search, userNo);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		System.out.println("결과페이지: "+resultPage);
		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);		
		map.put("search", search);
		
		return map;
	}*/
	@RequestMapping(value = "imageList", method = RequestMethod.POST)
	public Map imageList(@RequestBody(required=false) Search search, HttpSession session)throws Exception {
		System.out.println("서치 :" +search);
		int userNo = ((int)session.getAttribute("userNo"));

		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);		
		// Business logic 수행
		Map<String , Object> map=diaryService.getDiaryList(search, userNo);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		System.out.println("결과페이지: "+resultPage);
		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);		
		map.put("search", search);
		
		return map;
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
