package com.tmmmi.service.todo.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tmmmi.service.domain.ToDo;
import com.tmmmi.service.todo.ToDoDao;
import com.tmmmi.service.todo.ToDoService;

@Service("ToDoServiceImpl")
public class ToDoServiceImpl implements ToDoService {
	
	///Field
	@Autowired
	@Qualifier("ToDoDaoImpl")
	private ToDoDao toDoDao;
	 public void setToDoDao(ToDoDao toDoDao) {
		 this.toDoDao = toDoDao;
	 }
	
	public ToDoServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public List<ToDo> getToDoList(Map<String, Object> todomap) throws Exception{
		
		List<ToDo> toDoList = toDoDao.getToDoList(todomap);
		
		return toDoList;
	}

	@Override
	public void addToDo(ToDo toDo) throws Exception {
		toDoDao.addToDo(toDo);
	}

	@Override
	public void deleteToDo(ToDo toDo)throws Exception {
		toDoDao.deleteToDo(toDo);
	}

	@Override
	public void updateToDo(ToDo toDo) throws Exception {
		toDoDao.updateToDo(toDo);
		
	}

	@Override
	public void updateToDoComplete(ToDo toDo) throws Exception{
		toDoDao.updateToDoComplete(toDo);
	}
	
	@Override
	public void deleteToDoComplete(ToDo toDo) throws Exception {
		toDoDao.deleteToDoComplete(toDo);
	}
	@Override
	public void getToDoDayGraph() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getToDoMonthGraph() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getToDoWordCloud() {
		// TODO Auto-generated method stub
		
	}



}
