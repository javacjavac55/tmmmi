package com.tmmmi.service.todo;

import com.tmmmi.service.domain.ToDo;

public interface ToDoService {

	public void getToDoList();
	public void addToDo(ToDo toDo) throws Exception;
	public void deleteToDo();
	public void updateToDo(ToDo toDo) throws Exception;
	public void updateToDoCheck();
	public void getToDoDayGraph();
	public void getToDoMonthGraph();
	public void getToDoWordCloud();
}
