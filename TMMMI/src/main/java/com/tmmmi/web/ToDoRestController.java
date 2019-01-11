package com.tmmmi.web;

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
	@Qualifier("ToDoServiceImpl")
	private ToDoService toDoService;
	
	///Constructor
	public ToDoRestController() {
		System.out.println(this.getClass());
	}
	
	///Method
	@RequestMapping(value="/addToDo", method=RequestMethod.POST)
	public void addToDo(@RequestBody ToDo toDo) throws Exception{
		System.out.println("/addToDo 접근");
		System.out.println(toDo);
		toDoService.addToDo(toDo);
		System.out.println("/addToDo 완료");
	}
	@RequestMapping(value="/updateToDo", method=RequestMethod.POST)
	public void updateToDo(@RequestBody ToDo toDo) throws Exception{
		System.out.println("/addToDo 접근");
		System.out.println(toDo);
		toDoService.updateToDo(toDo);
		System.out.println("/addToDo 완료");	
	}
	public void updateToDoCheck() {}
	public void deleteToDo() {}
}
