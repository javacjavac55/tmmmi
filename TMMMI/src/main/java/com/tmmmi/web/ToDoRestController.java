package com.tmmmi.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.tmmmi.service.domain.ToDo;
import com.tmmmi.service.todo.ToDoService;
@RestController
@RequestMapping("/todoRest/*")
public class ToDoRestController {
	
	///Field
	@Autowired
	@Qualifier("toDoServiceImpl")
	private ToDoService toDoService;
	
	///Constructor
	public ToDoRestController() {
		System.out.println(this.getClass());
	}
	
	///Method
	@RequestMapping(value="/deleteToDo", method=RequestMethod.POST)
	public void deleteToDo(@RequestBody ToDo toDo, HttpSession session)throws Exception {
		System.out.println("/deleteToDo ����");
		int userNo = (int) session.getAttribute("userNo");
		toDo.setUserNo(userNo);
		System.out.println(toDo);
		toDoService.deleteToDo(toDo);
		System.out.println("/deleteToDo �Ϸ�");
	}
	@RequestMapping(value="/updateToDoComplete", method=RequestMethod.POST)
	public ToDo updateToDoComplete(@RequestBody ToDo toDo) throws Exception{
		System.out.println("/updateToDoComplete ����");
		System.out.println(toDo);
		toDoService.updateToDoComplete(toDo);
		ToDo reToDo = toDoService.getToDo(toDo);
		System.out.println(reToDo);
		System.out.println("/updateToDoComplete �Ϸ�");
		return reToDo;
	}
	@RequestMapping(value="/deleteToDoComplete",method=RequestMethod.POST)
	public ToDo deleteToDoComplete(@RequestBody ToDo toDo) throws Exception{
		System.out.println("/deleteToDoComplete ����");
		System.out.println("aaa"+toDo);
		toDoService.deleteToDoComplete(toDo);
		ToDo reToDo = toDoService.getToDoOne(toDo);
		System.out.println("reToDo : "+reToDo);
		System.out.println("/deleteToDoComplete �Ϸ�");
		return reToDo;
	}
	
	@RequestMapping(value="/getToDoMonthGraphPost",method=RequestMethod.POST)
	public List<ToDo> getToDoMonthGraphPost(@RequestBody String year, HttpSession session) throws Exception{
		System.out.println("�׷�������"+year);
		String startDate = year+"-01-01";
		String lastDate= year+"-12-31";
		System.out.println(startDate+","+lastDate);
		java.sql.Date startDate1 = java.sql.Date.valueOf(startDate);
		java.sql.Date lastDate1 = java.sql.Date.valueOf(lastDate);
		
		Map<String, Object> todomap = new HashMap<String, Object>();
		int userNo = (int) session.getAttribute("userNo");
		todomap.put("userNo", userNo);
		todomap.put("startDate", startDate1);
		todomap.put("lastDate", lastDate1);
		System.out.println(todomap);
		
		//Business Logic
		List<ToDo> todoMonth = toDoService.getToDoMonthGraph(todomap);
		return todoMonth;
	}
}
