package com.tmmmi.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.annotate.JsonProperty;
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
import com.tmmmi.service.diary.DiaryService;
import com.tmmmi.service.domain.Diary;
import com.tmmmi.service.domain.User;
import com.tmmmi.service.domain.UserCategory;
import com.tmmmi.service.user.UserService;
import com.tmmmi.service.usercategory.UserCategoryService;

@Controller
@RequestMapping("/diary/*")
public class DiaryController {
	
	@Autowired
	@Qualifier("diaryServiceImpl")
	private DiaryService diaryService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("userCategoryServiceImpl")
	private UserCategoryService userCategoryService;
	
	public DiaryController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping(value="addDiary", method=RequestMethod.GET)
	public ModelAndView addDiary(HttpSession session) throws Exception{
		
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNO:"+userNo);
		System.out.println("/diary/addDiary : GET");
		
		List<UserCategory> userCategory= userCategoryService.getUserCategoryList(userNo);
		System.out.println(userCategory);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userCategory" , userCategory);
		modelAndView.setViewName("/diary/addDiary.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addImageDiary", method=RequestMethod.GET)
	public ModelAndView addImageDiary(HttpSession session) throws Exception{
		
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNO:"+userNo);
		System.out.println("/diary/addImageDiary : GET");
		
		List<UserCategory> userCategory= userCategoryService.getUserCategoryList(userNo);
		System.out.println(userCategory);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userCategory" , userCategory);
		modelAndView.setViewName("/diary/addImageDiary.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addDiary", method=RequestMethod.POST)
	public ModelAndView addDiary(@ModelAttribute("diary") Diary diary, HttpSession session) throws Exception{
		System.out.println("/diary/addDiary : POST");
		
		int userNo = ((int)session.getAttribute("userNo"));		
		diary.setUserNo(userNo);
		diaryService.addDiary(diary);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("diary", diary);
		modelAndView.setViewName("redirect:/diary/listDiary");
		
		
		return modelAndView;
	}
	@RequestMapping(value="addImageDiary", method=RequestMethod.POST)
	public ModelAndView addImageDiary(@ModelAttribute("diary") Diary diary, HttpSession session) throws Exception{
		System.out.println("/diary/addImageDiary : POST");
		
		int userNo = ((int)session.getAttribute("userNo"));		
		diary.setUserNo(userNo);
		diaryService.addDiary(diary);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("diary", diary);
		modelAndView.setViewName("redirect:/diary/imageList");
		
		
		return modelAndView;
	}
	
	@RequestMapping(value="getDiary", method=RequestMethod.GET)
	public ModelAndView getDiary(@RequestParam("diaryNo") int diaryNo, HttpSession session, @RequestParam("currentPage") int currentPage)throws Exception {
		System.out.println("/diary/getDiary: GET");
		
		int userNo = ((int)session.getAttribute("userNo"));
		
		Search search = new Search();
		search.setCurrentPage(currentPage);
		
		Diary diary = diaryService.getDiary(diaryNo);
		UserCategory userCategory = userCategoryService.getUserCategoryByNo(diary.getUserCategoryNo());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("diary", diary);
		modelAndView.addObject("userCategory", userCategory);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("/diary/getDiary.jsp");
		
		return modelAndView;
		
		
	}
	
	@RequestMapping(value="getImageDiary", method=RequestMethod.GET)
	public ModelAndView getImageDiary(@RequestParam("diaryNo") int diaryNo, HttpSession session)throws Exception {
		System.out.println("/diary/getDiary: GET");
		
		int userNo = ((int)session.getAttribute("userNo"));
		
		
		
		Diary diary = diaryService.getDiary(diaryNo);
		UserCategory userCategory = userCategoryService.getUserCategoryByNo(diary.getUserCategoryNo());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("diary", diary);
		modelAndView.addObject("userCategory", userCategory);
		modelAndView.setViewName("/diary/getImageDiary.jsp");
		
		return modelAndView;
		
		
	}
	@RequestMapping(value="listDiary")
	public ModelAndView getDiaryList(@ModelAttribute("search") Search search , HttpSession session)throws Exception{
			
		int userNo = ((int)session.getAttribute("userNo"));
		
		
		//Diary diary = diaryService.getDiary(diaryNo);
		//UserCategory userCategory = userCategoryService.getUserCategoryByNo(diary.getUserCategoryNo());
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map=diaryService.getDiaryList(search, userNo);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("/diary/listDiary.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value="getListDiary")
	public ModelAndView getListDiary(@ModelAttribute("search") Search search , HttpSession session, @RequestParam("currentPage") int currentPage, @RequestParam("diaryNo") int diaryNo)throws Exception{
			
		int userNo = ((int)session.getAttribute("userNo"));
		
		Diary diary = new Diary();
		
		diary.setDiaryNo(diaryNo);
		
		//Diary diary = diaryService.getDiary(diaryNo);
		//UserCategory userCategory = userCategoryService.getUserCategoryByNo(diary.getUserCategoryNo());
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}else {
			search.setCurrentPage(currentPage);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map=diaryService.getDiaryList(search, userNo);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.addObject("diaryNo", diaryNo);
		modelAndView.setViewName("/diary/getListDiary.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="imageList")
	public ModelAndView imageList(@ModelAttribute("search") Search search , HttpSession session)throws Exception{
		
		int userNo = ((int)session.getAttribute("userNo"));
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);		
		
		Map<String , Object> map=diaryService.getDiaryList(search, userNo);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("/diary/imageList.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="getImageList")
	public ModelAndView getImageList(@ModelAttribute("search") Search search , HttpSession session)throws Exception{
		
		int userNo = ((int)session.getAttribute("userNo"));
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);		
		
		Map<String , Object> map=diaryService.getDiaryList(search, userNo);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("/diary/getImageList.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value="updateDiary", method=RequestMethod.GET)
	public ModelAndView updateDiary(@RequestParam("diaryNo")int diaryNo, HttpSession session, @RequestParam("currentPage") int currentPage)throws Exception {
		System.out.println("/diary/updateDiary : GET");
		
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNO:"+userNo);
		
		List<UserCategory> userCategory= userCategoryService.getUserCategoryList(userNo);
		Diary diary = diaryService.getDiary(diaryNo);
		
		Search search = new Search();
		search.setCurrentPage(currentPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("diary",diary);
		modelAndView.addObject("userCategory", userCategory);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("/diary/updateDiary.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="updateImageDiary", method=RequestMethod.GET)
	public ModelAndView updateImageDiary(@RequestParam("diaryNo")int diaryNo, HttpSession session)throws Exception {
		System.out.println("/diary/updateDiary : GET");
		
		int userNo = ((int)session.getAttribute("userNo"));
		System.out.println("userNO:"+userNo);
		
		List<UserCategory> userCategory= userCategoryService.getUserCategoryList(userNo);
		Diary diary = diaryService.getDiary(diaryNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("diary",diary);
		modelAndView.addObject("userCategory", userCategory);
		modelAndView.setViewName("/diary/updateImageDiary.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="updateDiary", method=RequestMethod.POST)
	public ModelAndView updateDiary(@ModelAttribute("diary") Diary diary, @ModelAttribute("search") Search search) throws Exception{
		System.out.println("/diary/updateDiary : POST");
		
		diaryService.updateDiary(diary);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("diary", diary);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("redirect:/diary/getDiary?diaryNo="+diary.getDiaryNo()+"&currentPage="+search.getCurrentPage());
		
		return modelAndView;
	}
	@RequestMapping(value="updateImageDiary", method=RequestMethod.POST)
	public ModelAndView updateImageDiary(@ModelAttribute("diary") Diary diary) throws Exception{
		System.out.println("/diary/updateDiary : POST");
		
		diaryService.updateDiary(diary);
		Search search = new Search();
		
		search.setCurrentPage(1);
		int currentPage = search.getCurrentPage();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("diary", diary);
		modelAndView.addObject("currentPage", currentPage);
		modelAndView.setViewName("redirect:/diary/getImageDiary?diaryNo="+diary.getDiaryNo());
		
		return modelAndView;
	}
	
	@RequestMapping(value="deleteDiary", method=RequestMethod.POST)
	public ModelAndView deleteDiary(@RequestParam("deleteDiary") String diaryNo)  throws Exception{
		
		System.out.println("/diary/deleteDiary");
		System.out.println("다이어리 번호:"+diaryNo);
		
		String[] arrIdx =  diaryNo.split(",");
		for (int i=0; i<arrIdx.length; i++) {
			diaryService.deleteDiary(Integer.parseInt(arrIdx[i]));
		}	
				
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/diary/listDiary");
		
		return modelAndView;
	}
	@RequestMapping(value="deleteImage", method=RequestMethod.POST)
	public ModelAndView deleteImage(@RequestParam("deleteImage") int diaryNo)  throws Exception{
		
		System.out.println("/diary/deleteImage");
		System.out.println("다이어리 번호:"+diaryNo);
		
		
		diaryService.deleteDiary(diaryNo);
		System.out.println("dkdkdk");
				
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/diary/imageList");
		
		return modelAndView;
	}
	
	/*@RequestMapping(value = "imageDiary", method = RequestMethod.POST)
    public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception{
 
        OutputStream out = null;
        PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
 
        try{
 
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
            String uploadPath = "저장경로/" + fileName;//저장경로
 
            out = new FileOutputStream(new File(uploadPath));
            out.write(bytes);
            String callback = request.getParameter("CKEditorFuncNum");
 
            printWriter = response.getWriter();
            String fileUrl = "저장한 URL경로/" + fileName;//url경로
 
            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
                    + callback
                    + ",'"
                    + fileUrl
                    + "','이미지를 업로드 하였습니다.'"
                    + ")</script>");
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
    }*/
	
	/*@RequestMapping("imageDiary")
	public void imageDiary(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) throws Exception{
		System.out.println("아 제발");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String fileName=upload.getOriginalFilename();
		byte[] bytes=upload.getBytes();
		String uploadPath="C:\\Users\\Bit\\git\\tmmmi\\TMMMI\\WebContent\\resources\\images\\diaryImage\\";
		OutputStream out = new FileOutputStream(new File(uploadPath+fileName));
		out.write(bytes);
		String callback = request.getParameter("CKEditorFuncNum");
		PrintWriter printWriter = response.getWriter();
		String fileUrl=request.getContextPath()+"/images/"+fileName;
		printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','이미지가 업로드 되었습니다.')"+"</script>");
		printWriter.flush();
	}*/
	
	 @RequestMapping(value = "imageDiary", method = RequestMethod.POST)
	    public void imageDiary(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
		 	System.out.println("123");
	        OutputStream out = null;
	        PrintWriter printWriter = null;
	        response.setCharacterEncoding("utf-8");
	        response.setContentType("text/html;charset=utf-8");
	 
	        try{
	        	boolean uploadFinish = false;
	            String fileName = System.currentTimeMillis() + "." +upload.getOriginalFilename().split("\\.")[1];
	            byte[] bytes = upload.getBytes();
	            String uploadPath = "C:\\Users\\Bit\\git\\tmmmi\\TMMMI\\WebContent\\resources\\images\\diaryImage\\" + fileName;//저장경로
	            
	            File file = new File(uploadPath);
	            out = new FileOutputStream(file);
	            out.write(bytes);
	            
	            String callback = request.getParameter("CKEditorFuncNum");
	 
	            printWriter = response.getWriter();
	            String fileUrl = "/images/diaryImage/" + fileName;//url경로	            
	            
	            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("+1+ ",'"+fileUrl+ "',''"+ ");\n</script>");
	            //printWriter.write("{\"uploaded\": 1,\"fileName\": \""+fileName+"\", \"url \" :"+"\"http://192.168.0.53:8080/images/diaryImage/"+fileName+"\"}");
	            printWriter.flush();
	            
	            // exists , isFile 둘다 파일이있다고 나옴
	            if (file.exists()) {
	            	System.out.println("파일이 있습니다.");
	            	System.out.println(file.getCanonicalPath().toString());
	            }else {
	            	System.out.println("파일이 없습니다.");
	            }
	           
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
