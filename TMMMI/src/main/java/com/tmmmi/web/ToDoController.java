package com.tmmmi.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.domain.ToDo;
import com.tmmmi.service.todo.ToDoService;

@Controller
@RequestMapping("/todo/*")
public class ToDoController {
	
	///Field
	@Autowired
	@Qualifier("ToDoServiceImpl")
	private ToDoService toDoService;
	
	///Constructor
	public ToDoController() {
	}
	
	///Method
	@RequestMapping(value="/addToDo", method=RequestMethod.POST)
	public ModelAndView addToDo(@ModelAttribute("todo") ToDo toDo) throws Exception{
		System.out.println("/addToDo 접근");
		System.out.println(toDo);
		toDoService.addToDo(toDo);
		System.out.println("/addToDo 완료");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/todo/getToDoListGET?userNo=7");
		return modelAndView;
	}
	
	@RequestMapping(value="/getToDoListGET", method=RequestMethod.GET)
	public ModelAndView getToDoList(@RequestParam("userNo") int userNo) throws Exception{
		
		System.out.println("/getToDoList 접근");
		Map<String, Object> todomap = toDoService.getToDoList(userNo);
		System.out.println(todomap);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/todo/listToDo.jsp");
		modelAndView.addObject("todolist", todomap.get("todolist"));
		return modelAndView;
	}
	
	@RequestMapping(value="/getToDoListPOST", method=RequestMethod.POST)
	public ModelAndView getToDoList() throws Exception{
		return null;
		}
	public void getToDoDayGraph() {}
	public void getToDoMonthGraph() {}
	public void getToDoWordCloud() {}
	
}
