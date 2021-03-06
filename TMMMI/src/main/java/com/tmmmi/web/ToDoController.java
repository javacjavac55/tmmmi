package com.tmmmi.web;

import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tmmmi.service.domain.ToDo;
import com.tmmmi.service.todo.ToDoService;
import com.tmmmi.service.user.UserService;

@Controller
@RequestMapping("/todo/*")
public class ToDoController {
	
	///Field
	@Autowired
	@Qualifier("toDoServiceImpl")
	private ToDoService toDoService;
	
	///Constructor
	public ToDoController() {
	}
	
	///Method
	@RequestMapping(value="/addToDo", method=RequestMethod.POST)
	public ModelAndView addToDo(@ModelAttribute("todo") ToDo toDo, HttpSession session) throws Exception{
		System.out.println("/addToDo 접근");
		System.out.println(toDo);
		int userNo = (int)session.getAttribute("userNo");
		toDo.setUserNo(userNo);
		toDoService.addToDo(toDo);
		System.out.println("/addToDo 완료");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/todo/getToDoList");
		return modelAndView;
	}
	@RequestMapping(value="/updateToDo", method=RequestMethod.POST)
	public ModelAndView updateToDo(@ModelAttribute("todo") ToDo toDo, HttpSession session) throws Exception{
		System.out.println("/updateToDo 접근");
		System.out.println(toDo);
		int userNo = (int)session.getAttribute("userNo");
		toDo.setUserNo(userNo);
		toDoService.updateToDo(toDo);
		System.out.println("/updateToDo 완료");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/todo/getToDoList");
		return modelAndView;
	}
	@RequestMapping(value="/getToDoList", method=RequestMethod.GET)
	public ModelAndView getToDoList(HttpSession session) throws Exception{
		System.out.println("/getToDoListGET 접근");
		int userNo = (int)session.getAttribute("userNo");
		
		//현재 날짜 계산
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd");
		String mTime = mSimpleDateFormat.format(new Date());
		java.sql.Date targetDate = java.sql.Date.valueOf(mTime);
		System.out.println ("targetDate : "+targetDate);
		
		Map<String, Object> todomap = new HashMap<String, Object>();
		todomap.put("userNo", userNo);
		todomap.put("targetDate", targetDate);
		System.out.println(todomap);
	
		//Business Logic
		List<ToDo> todolist = toDoService.getToDoList(todomap);
		//ModelAndView
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("todolist"+todolist);
		modelAndView.setViewName("/todo/listToDo.jsp");
		modelAndView.addObject("todolist",todolist);
		modelAndView.addObject("targetDate",mTime);
		System.out.println(modelAndView);
		return modelAndView;
		}
		
	@RequestMapping(value="/getToDoList", method=RequestMethod.POST)
	public ModelAndView getToDoList(@RequestBody String dayinput, HttpSession session) throws Exception{
		System.out.println("/getToDoListPOST 접근");
		int userNo = (int)session.getAttribute("userNo");
		System.out.println(dayinput);
		java.sql.Date targetDate1 = java.sql.Date.valueOf(dayinput.split("=")[1]);
		//Business Logic
		Map<String, Object> todomap = new HashMap<String, Object>();
		todomap.put("userNo", userNo);
		todomap.put("targetDate", targetDate1);
		List<ToDo> todolist = toDoService.getToDoList(todomap);
		String targetDate = dayinput.split("=")[1];
		//ModelAndView
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/todo/listToDo.jsp");
		modelAndView.addObject("targetDate", targetDate);
		modelAndView.addObject("todolist",todolist);
		System.out.println(modelAndView);
		return modelAndView;
		}
	
	public void getToDoDayGraph() {}
	
	@RequestMapping(value="/getToDoMonthGraph", method=RequestMethod.GET)
	public ModelAndView getToDoMonthGraph(HttpSession session) throws Exception {
		System.out.println("/getToDoMonthGraph 접근");
		int userNo = (int)session.getAttribute("userNo");
		
		//현재 날짜 계산
		int year = Year.now().getValue();
		String transYear = Integer.toString(year);
		String startDate = transYear+"-01-01";
		String lastDate= transYear+"-12-31";
		java.sql.Date startDate1 = java.sql.Date.valueOf(startDate);
		java.sql.Date lastDate1 = java.sql.Date.valueOf(lastDate);
		
		Map<String, Object> todomap = new HashMap<String, Object>();
		todomap.put("userNo", userNo);
		todomap.put("startDate", startDate1);
		todomap.put("lastDate", lastDate1);
		System.out.println(todomap);
		
		//Business Logic
		List<ToDo> todoMonth = toDoService.getToDoMonthGraph(todomap);
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("todoMonth"+todoMonth);
		modelAndView.setViewName("/todo/getToDoMonthGraph.jsp");
		modelAndView.addObject("todoMonth",todoMonth);
		return modelAndView;
	}
}
