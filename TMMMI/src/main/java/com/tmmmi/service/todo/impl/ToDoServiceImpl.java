package com.tmmmi.service.todo.impl;

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
	public void getToDoList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addToDo(ToDo toDo) throws Exception {
		toDoDao.addToDo(toDo);
	}

	@Override
	public void deleteToDo() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateToDo(ToDo toDo) throws Exception {
		toDoDao.updateToDo(toDo);
		
	}

	@Override
	public void updateToDoCheck() {
		// TODO Auto-generated method stub
		
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
