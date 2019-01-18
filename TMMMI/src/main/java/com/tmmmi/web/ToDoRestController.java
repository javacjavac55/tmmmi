package com.tmmmi.web;

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
	@RequestMapping(value="/updateToDo", method=RequestMethod.POST)
	public void updateToDo(@RequestBody ToDo toDo) throws Exception{
		System.out.println("/updateToDo 접근");
		System.out.println(toDo);
		toDoService.updateToDo(toDo);
		System.out.println("/updateToDo 완료");	
	}
	@RequestMapping(value="/deleteToDo", method=RequestMethod.POST)
	public void deleteToDo(@RequestBody ToDo toDo, HttpSession session)throws Exception {
		System.out.println("/deleteToDo 접근");
		int userNo = (int) session.getAttribute("userNo");
		toDo.setUserNo(userNo);
		System.out.println(toDo);
		toDoService.deleteToDo(toDo);
		System.out.println("/deleteToDo 완료");
	}
	@RequestMapping(value="/updateToDoComplete", method=RequestMethod.POST)
	public void updateToDoComplete(@RequestBody ToDo toDo) throws Exception{
		System.out.println("/updateToDoComplete 접근");
		System.out.println(toDo);
		toDoService.updateToDoComplete(toDo);
		System.out.println("/updateToDoComplete 완료");
	}
	@RequestMapping(value="/deleteToDoComplete",method=RequestMethod.POST)
	public void deleteToDoComplete(@RequestBody ToDo toDo) throws Exception{
		System.out.println("/deleteToDoComplete 접근");
		System.out.println(toDo);
		toDoService.deleteToDoComplete(toDo);
		System.out.println("/deleteToDoComplete 완료");
	}
}
