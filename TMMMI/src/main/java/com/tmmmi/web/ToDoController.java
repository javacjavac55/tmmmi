package com.tmmmi.web;

import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@Qualifier("UserServiceImpl")
	private UserService userService;
	
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
		String mTime = mSimpleDateFormat.format( new Date());
		java.sql.Date targetDate = java.sql.Date.valueOf(mTime);
		System.out.println ("targetDate : "+targetDate);
		
		Map<String, Object> todomap = new HashMap<String, Object>();
		todomap.put("userNo", userNo);
		todomap.put("targetDate", targetDate);
		System.out.println(todomap);
		SimpleDateFormat mSimpleDateFormat2 = new SimpleDateFormat ( "yyyy년 MM월 dd일");
		String displaydate = mSimpleDateFormat2.format(new Date());
		
		//Business Logic
		List<ToDo> todolist = toDoService.getToDoList(todomap);
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("todolist"+todolist);
		modelAndView.setViewName("/todo/listToDo.jsp");
		modelAndView.addObject("todolist",todolist);
		modelAndView.addObject("displaydate", displaydate);
		System.out.println(modelAndView);
		return modelAndView;
		}
		
	@RequestMapping(value="/getToDoList", method=RequestMethod.POST)
	public ModelAndView getToDoList(@RequestBody String dayinput, HttpSession session) throws Exception{
		System.out.println("/getToDoListPOST 접근");
		System.out.println(dayinput.split("=")[1]);
		int userNo = (int)session.getAttribute("userNo");
		
		java.sql.Date targetDate1 = java.sql.Date.valueOf(dayinput.split("=")[1]);
		System.out.println ("targetDate : "+targetDate1);
		
		Map<String, Object> todomap = new HashMap<String, Object>();
		todomap.put("userNo", userNo);
		todomap.put("targetDate", targetDate1);
		System.out.println(todomap);
		
		//Business Logic
		List<ToDo> todolist = toDoService.getToDoList(todomap);
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("todolist"+todolist);
		SimpleDateFormat mSimpleDateFormat2 = new SimpleDateFormat ( "yyyy-MM-dd");
		Date tDate = mSimpleDateFormat2.parse(dayinput.split("=")[1]);
		System.out.println(tDate);
		SimpleDateFormat mSimpleDateFormat3 = new SimpleDateFormat ( "yyyy년 MM월 dd일");
		String displaydate = mSimpleDateFormat3.format(tDate);
		
		System.out.println("displayDate : "+displaydate);
		
		modelAndView.setViewName("/todo/listToDo.jsp");
		modelAndView.addObject("todolist",todolist);
		modelAndView.addObject("displaydate", displaydate);
		modelAndView.addObject("changedate", tDate);
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
	public void getToDoWordCloud() {}
	
}
