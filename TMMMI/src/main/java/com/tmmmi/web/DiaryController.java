package com.tmmmi.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.tmmmi.service.diary.DiaryService;
import com.tmmmi.service.domain.Diary;

@Controller
@RequestMapping("/diary/*")
public class DiaryController {
	
	@Autowired
	@Qualifier("diaryServiceImpl")
	private DiaryService diaryService;

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
	public ModelAndView addDiary() throws Exception{
		
		System.out.println("/diary/addDiary : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/diary/addDiary.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addDiary", method=RequestMethod.POST)
	public ModelAndView addDiary(@ModelAttribute("diary") Diary diary) throws Exception{
		System.out.println("/diary/addDiary : POST");
		
		diaryService.addDiary(diary);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("Diary", diary);
		modelAndView.setViewName("/diary/getDiary.jsp");
		
		
		return modelAndView;
	}
	
	@RequestMapping(value="getDiary", method=RequestMethod.GET)
	public ModelAndView getDiary(@RequestParam("diaryNo") int diaryNo)throws Exception {
		System.out.println("/diary/getDiary: GET");
		
		
		Diary diary = diaryService.getDiary(diaryNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("diary", diary);
		modelAndView.setViewName("/diary/getDiary.jsp");
		
		return modelAndView;
		
		
	}
	@RequestMapping(value="listDiary")
	public ModelAndView getDiaryList(@ModelAttribute("search") Search search, @ModelAttribute("Diary") Diary diary, HttpServletRequest request, HttpSession session)throws Exception{
		System.out.println("/listDiary: GET/POST");
		
		int userNo = 4213;
		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
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
	public void updateDiary() {}
	public void deleteDiary() {}

}