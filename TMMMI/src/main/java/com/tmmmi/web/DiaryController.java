package com.tmmmi.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	@RequestMapping(value="/addDiary", method=RequestMethod.GET)
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
	public void getDiary() {}
	public void getDiaryList() {}
	public void updateDiary() {}
	public void deleteDiary() {}

}
